final float vx0min = -7;            // vxの初期値の下限
final float vx0max = 5;             // vxの初期値の上限
final float vy0min = 4;             // vyの初期値の下限
final float vy0max = 8;             // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
final float gravity = 9.8/60;    // 1フレームあたりの重力加速度
final float elas = 0.98;            // 反発係数
final float d = 40;
final float hueMax = 360.0;         // 色相の最大値

// 変数
Ball ball0;                         // ボールのオブジェクト1つを参照する変数
Ball ball1;

void setup() {
    frameRate(fps);
    size(480, 480);
    noStroke();
    colorMode(HSB, hueMax, 100, 100);
    fill(0, 0, 0);
    ball0 = new Ball();
    ball1 = new Ball();
    ball0.d  = d;
    ball1.d = d;
    ball0.x  = random(d / 2, width - d / 2);     // ボールの中心のx座標
    ball1.x  = random(d / 2, width - d / 2);
    ball0.y  = random(d / 2, height / 5);        // ボールの中心のy座標
    ball1.y  = random(d / 2, height / 5);
    ball0.vx = random(vx0min, vx0max);           // ボールの速度のx成分
    ball0.vy = random(vy0min, vy0max);           // ボールの速度のy成分
    ball1.vx = random(vx0min, vx0max);
    ball1.vy = random(vy0min, vy0max);
    ball0.hue = 0;
    ball1.hue = 180;
    ball0.brightness = 0;
    ball1.brightness = 100;
}

void draw() {
    background(0, 0, 100);
    ball0.move(false,0,0);
    ball0.draw();
    ball1.move(true,ball0.x,ball0.y);
    ball1.draw();
}




/** 動くボールを表す */
class Ball {
    float d;
    float x;
    float y;
    float vx;
    float vy;
    float hue;
    float brightness;
    void draw(){
        fill(hue,100,brightness);
        ellipse(x, y, d, d);
    }

    void move(boolean chace,float cx,float cy) {
        if(!chace){
            x  += vx;          // ボールが速度ぶん移動する
            vy += gravity;          // 速度のy成分に重力加速度を加算する
            y  += vy;
        }else{
            if(x>cx){
                vx -= dist(x,y,cx,cy)/500;
            }else{
                vx += dist(x,y,cx,cy)/500;
            }
            if(y>cy){
                vy -= dist(x,y,cx,cy)/500;
            }else{
                vy += dist(x,y,cx,cy)/500;
            }
            x+=vx;
            y+=vy;
        }
        if (x < d / 2) {
            vx = - vx * elas;
            x = d / 2;
        } else if (x > width - d / 2) {
            vx = - vx  * elas;
            x = width - d / 2;
        }
        if (y > height - d / 2) {
            vy = - vy * elas;
            y = height - d / 2;
        } else if (y < d / 2) {
            vy = - vy * elas;
            y = d / 2;
        }
    }
}