Rects re;

void setup(){
    colorMode(HSB, 360, 100, 100);
    size(400, 400);
    re = new Rects();//クラス宣言
}
void draw(){
    background(0,0,100);
    re.draw();
}

class Rects{
    float si = 50;//四角のサイズ
    float hg =si/2;//高さ
    float speed = random(3, 10);//スピード
    void draw(){
        //描画
        fill(0,100,100);
        rect(width/2-si, hg, si, si);
        fill(180,100,100);
        rect(width/2+si, height-hg-si, si, si);
        hg+=speed;
        //加速処理
        if(hg>height-si||hg<0){
            speed = -speed;//壁にあたった時反転
        }
    }
}