//
// ブロック崩し (バー操作はマウス式)
//実行することでプレイ可能
//追加機能:お邪魔ボールとブロックの復活機能,スコア機能の追加。
//

// ブロック崩し本体
BlockBreak blockBreak;

// セットアップ
void setup() {
    size(400, 500);         // ウインドウ設定
    fill(0, 0, 0);          // 塗りつぶし初期値
    blockBreak = new BlockBreak();
}

// 1フレームごとの描画処理
void draw() {
    background(255, 255, 255);      // 背景の初期化(フラッシュ)
    blockBreak.draw();
}

/**
* ブロック崩し
*/
class BlockBreak {
    //ブロック数設定
    final int blockNumX = 20;                           // x軸方向のブロック数(適当に変えてもOK)
    final int blockNumY = 5;                            // y軸方向のブロック数(適当に変えてもOK)
    final int blockNumAll = blockNumX * blockNumY;      // 総ブロック数
    //ブロック関連の初期値や固定値の設定
    final int blockX_init = 0;                          // ブロック位置x軸初期値
    int blockX = 0;                                     // ブロック位置x軸
    int blockY = 35;                                    // ブロック位置y軸
    //各オブジェクト定義
    Ball ball;                                          // ボール定義
    Bar bar;                                            // バー定義
    Block[][] block;                                    // ブロック配列定義
    int tokuten = 0;
    //コンストラクタ
    BlockBreak() {
        // ボールの生成
        ball = new Ball(width / 4, height / 3, 2, 5, 8);
        // バーの生成
        bar = new Bar(width / 5, height / 100);
        // ブロック配列を生成
        block = new Block[blockNumY][blockNumX];
        // ブロックのサイズを決定
        int blockSizeX = width / blockNumX;
        int blockSizeY = height / 30;
        // ブロック群を生成 [回答欄]
        for (int i = 0;i < blockNumY;i++) {
            for (int d = 0;d < blockNumX;d++) {
                block[i][d] = new Block(blockSizeX * d,blockSizeY * i,blockSizeX,blockSizeY);
            }
        }
    }
    /** 1フレームごとの描画処理 */
    void draw() {
    // 全てのブロックの破壊判定と描画 [回答欄]
    // クリアしているかの判定のため、壊れているブロックの数をカウントもしておく
    // ヒント: ブロックが消滅している場合、ブロックの衝突判定も描画も行わない
    int breakBlockNum = 0;          // 壊れているブロックの数を初期化
    for(int i = 0;i<blockNumY;i++){
        for(int d=0;d<blockNumX;d++){
            if(!block[i][d].isBroken()){
                block[i][d].collision(ball);
                block[i][d].show();
                for(int l = 0;l<blockNumY;l++){
                    for(int k=0;k<blockNumX;k++){
                        if(block[l][k].add_ball!=null){
                            block[i][d].collision(block[l][k].add_ball);
                        }
                    }
                }
            }else if(block[i][d].add_ball!=null){
                if(block[i][d].add_ball.collision()==false){
                    block[i][d].add_ball = null;
                }else{
                    block[i][d].add_ball.move();
                    block[i][d].add_ball.show();
                    bar.collision(block[i][d].add_ball);
                }
                breakBlockNum++;
            }else{
                block[i][d].count++;
                if(block[i][d].count >= 600){
                    block[i][d].respawn();
                }
                breakBlockNum++;
            }
        }
    }
    // ブロックが残っているならばボール移動
    if(breakBlockNum < blockNumAll) {
    	ball.move();                            // ボールの移動処理
    	if(ball.collision() == false) {         // 壁との衝突判定
            fill(0, 0, 0);
            textSize(35);
            textAlign(CENTER, CENTER);
            text("Game Over!!", width / 2, height / 2);
        }
        else{
    		bar.collision(ball);                    // バーとの衝突判定
        }
    }
    else{  // ブロックがすべて壊れているならば
        textSize(35);
    	textAlign(CENTER, CENTER);                // テキストの配置を整える
    	text("Clear!!", width / 2, height / 2);   // クリア表示
    }
    fill(0, 0, 0);
    textSize(12);
    textAlign(CENTER, CENTER);
    text("Score:"+tokuten+"\nBlock:" + (blockNumAll - breakBlockNum), width - 40, height - 50);   // 残りブロック数表示
    bar.show();            // ボールを打ち返すためのボードを表示
    ball.show();           // ボールの描画
    }
}

    /**
    *  ボール（主にボールの移動）
    */
class Ball {
    int x;// ボールのX座標
    int y;// ボールのY座標
    int vx;                         // ボールのX軸速度
    int vy;                         // ボールのY軸速度
    int d;// ボールの直径
    boolean penetrability;          // ボールのブロック貫通性

    // コンストラクタ
    Ball(int x, int y, int vx, int vy, int d) {
        this.x = x;
        this.y = y;
        this.vx = vx;
        this.vy = vy;
        this.d = d;
        penetrability = false;
    }

        // ボールの移動
    void move() {
        x += vx;
        y += vy;
    }

        // 壁との衝突判定
    boolean collision() {
        if (x <= d / 2) {  // 左壁
            x = d / 2;
            vx = -vx;
        }
        if (y <= d / 2) {  // 天井
            y = d / 2;
            vy = -vy;
        }
        if (x >= (width - d / 2)) {  // 右壁
            x = width - d / 2;
            vx = -vx;
        }
        if (y >= (height - d / 2)) {  // 底面(ゲームオーバー)
            vx = 0;
            vy = 0;
            return false;
        }
        return true;
    }

        // ボールの描画
    void show() {
        if (penetrability) {
            fill(255, 0, 0);        //　貫通弾の時は赤
        }
        else{
            fill(0, 0,0);          //　通常時は黒
        }
        ellipse(x, y, d, d);      // ボールの描画
    }

    int getX() {
        return x;
    }
    void setY(int y) {
        this.y = y;
    }
    int getY() {
        return y;
    }
    void setVx(int vx) {
        this.vx = vx;
    }
    int getVx() {
        return vx;
    }
    void setVy(int vy) {
        this.vy = vy;
    }
    int getVy() {
        return vy;
    }
    int getD() {
        return d;
    }
    void setPenetrability(boolean penetrability) {
        this.penetrability = penetrability;
    }
    boolean getPenetrability() {
        return penetrability;
    }
}

    /**
    * バー
    */
class Bar {
    final int y = height - 50;    // バーの左上のy座標 (底から50で固定)
    int sizeX;//バー全体の幅(なるべく5の倍数が良い)
    int sizeY;// バーの高さ
    int boxSizeX;                 //分割した時の箱一つ分の幅(全体の1/5)
    int[] boxX;   //バーの各区切りのx座標(左から0)
    Bar(int sizeX, int sizeY) {
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        boxSizeX = sizeX / 5;
        boxX = new int[6];
    }
    void collision(Ball ball) {
        if ((ball.getY() >= (y - ball.getD() / 2)) && (ball.getY() <= (y + sizeY - ball.getD() / 2))) {  // ボールのy座標がバーと重なる時
            if ((ball.getX() >= boxX[0]) && (ball.getX() <= boxX[1])) {  // 左黒Boxに衝突
                ball.setVx( -2);
                ball.setY(y - ball.getD() / 2);
                ball.setVy( -ball.getVy());
                ball.setPenetrability(false);    // ボールのブロック貫通性なし
            }
            else if ((ball.getX() > boxX[1]) && (ball.getX() <= boxX[2])) {   // 左白Boxに衝突
                ball.setVx( -1);
                ball.setY(y - ball.getD() / 2);
                ball.setVy( -ball.getVy());
                ball.setPenetrability(false);    // ボールのブロック貫通性なし
            }
            else if ((ball.getX() > boxX[2]) && (ball.getX() <= boxX[3])) {   // 中心赤Boxに衝突
                ball.setY(y - ball.getD() / 2);
                ball.setVy( -ball.getVy());
                ball.setPenetrability(true);     // ボールのブロック貫通性あり
            }
            else if ((ball.getX() > boxX[3]) && (ball.getX() <= boxX[4])) {   // 右白Boxに衝突
                ball.setVx(1);
                ball.setY(y - ball.getD() / 2);
                ball.setVy( -ball.getVy());
                ball.setPenetrability(false);    // ボールのブロック貫通性なし
            }
            else if ((ball.getX() > boxX[4]) && (ball.getX() <= boxX[5])) {   // 右黒Boxに衝突
                ball.setVx(2); 
                ball.setY(y - ball.getD() / 2);
                ball.setVy( -ball.getVy());
                ball.setPenetrability(false);    // ボールのブロック貫通性なし
            }
        }
    }
    void show() {
        boxX[0] = mouseX - this.sizeX / 2;            // 左黒Boxの左上頂点のx座標
        boxX[1] = mouseX - 3 * (boxSizeX / 2);     // 左白Boxの左上頂点のx座標
        boxX[2] = mouseX - boxSizeX / 2;           // 中央赤Boxの左上頂点のx座標
        boxX[3] = mouseX + boxSizeX / 2;           // 右白Boxの左上頂点のx座標
        boxX[4] = mouseX + 3 * (boxSizeX / 2);      // 右黒Boxの左上頂点のx座標
        boxX[5] = mouseX + this.sizeX / 2;            // 右黒Boxの"右上"頂点のx座標
        fill(0, 0, 0);
        rect(boxX[0], y, boxSizeX, sizeY);        // 左黒Box
        fill(255, 255, 255);
        rect(boxX[1], y, boxSizeX, sizeY);        // 左白Box
        fill(255, 0, 0);
        rect(boxX[2], y, boxSizeX, sizeY);        // 中央赤Box
        fill(255, 255, 255);
        rect(boxX[3], y, boxSizeX, sizeY);        // 右黒Box
        fill(0, 0, 0);
        rect(boxX[4], y, boxSizeX, sizeY);        // 右白Box
    }
    int getX(int i) {
        return boxX[i];
    }
    int getY() {
        return y;
    }

    int getSizeX() {
        return sizeX;
    }

    int getSizeY() {
        return sizeY;
    }
}

class Block {
    int x;                       // 左上頂点のx座標
    int y;                       // 左上頂点のy座標
    int sizeX;                   // ブロックの幅
    int sizeY;                   // ブロックの高さ
    int broken_count = 2;
    boolean broken;              // ブロックが破壊されているか否か
    Ball add_ball;
    int count = 0;
            // コンストラ
    Block(int x, int y, int sizeX, int sizeY) {
        this.x = x;
        this.y = y;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        broken = false;
    }

    void respawn(){
        broken = false;
        count = 0;
        broken_count=2;
    }
            // ブロックの描画メソッド
    void show() {
        if(broken_count==2){
            fill(0, 0, 255);       // ブロックの色は青
        }else if(broken_count==1){
            fill(0, 0, 200);
        }else if(broken_count==0){
            fill(0, 0, 150);
        }
        rect(x, y, sizeX, sizeY);
    }
            // ボールとブロックとの衝突と破壊判定
            // 今回,ボールの衝突判定はボールの中心座標のみで行っている
    void collision(Ball ball) {
                // ボールが貫通弾でないなら、衝突した際にボールの進行方向を変える(速度を変える)
                    // ブロック左側に当たった場合
            if ((ball.getX() >= x) && (ball.getX() <= (x + 5)) && (ball.getY() >= y) && (ball.getY() <= (y + sizeY))) {
                ball.setVx( -1 * ball.getVx());
            if (ball.getPenetrability()) {
                broken_count=0;
            }
        }
                    // ブロック右側に当たった場合
            if ((ball.getX() >= (x + sizeX - 5)) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= y) && (ball.getY() <= (y + sizeY))) {
                ball.setVx( -1 * ball.getVx());
            if (ball.getPenetrability()) {
                broken_count=0;
            }
        }
            if ((ball.getX() >= x) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= y) && (ball.getY() <= (y + 5))) {
                ball.setVy( -1 * ball.getVy());
            if (ball.getPenetrability()) {
                broken_count=0;
            }
        }
            if ((ball.getX() >= x) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= (y + sizeY - 5)) && (ball.getY() <= (y + sizeY))) {
                ball.setVy( -1 * ball.getVy());
            if (ball.getPenetrability()) {
                broken_count=0;
            }
        }
        if ((ball.getX() >= x) && (ball.getX() <= (x + sizeX)) && (ball.getY() >= y) && (ball.getY() <= (y + sizeY))) {
            if(broken_count<=0){
                blockBreak.tokuten++;
                broken = true;
                add_ball = new Ball(x+sizeX/2,y+sizeY/2,2,5,8);
            }else{
                broken_count--;
            }
        }
    }
    boolean isBroken() {
        return broken;
    }
}