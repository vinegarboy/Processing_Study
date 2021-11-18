final float vx0min = -3.5;            // vxの初期値の下限
final float vx0max = 2.5;             // vxの初期値の上限
final float vy0min = 2;             // vyの初期値の下限
final float vy0max = 4;             // vyの初期値の上限
final float fps = 60;               // 1秒間あたりのフレーム数
float xgravity = 0;    // 1フレームあたりの重力加速度
float ygravity = 9.8/fps;
final float elas = 0.6;            // 反発係数
final float d = 40;                 // ボールの直径
final float hueMax = 360.0;         // 色相の最大値

// 変数
Ball ball0;                         // ボールのオブジェクト1つを参照する変数

void setup() {
    frameRate(fps);
    size(480, 480);
    noStroke();
    colorMode(HSB, hueMax, 100, 100);
    fill(0, 0, 0);
    ball0 = new Ball();
    ball0.d  = d;
    ball0.x  = random(d / 2, width - d / 2);     // ボールの中心のx座標
    ball0.y  = random(d / 2, height / 5);        // ボールの中心のy座標
    ball0.vx = random(vx0min, vx0max);           // ボールの速度のx成分
    ball0.vy = random(vy0min, vy0max);           // ボールの速度のy成分
}

void draw() {
    background(0, 0, 100);
    ball0.move();
    ball0.draw();
}




/** 動くボールを表す */
class Ball {
    float d;
    float x;
    float y;
    float vx;
    float vy;
    float hue;
    void draw(){
        fill(hue,100,100);
        ellipse(x, y, d, d);
    }

    void move() {
        x  += vx;          // ボールが速度ぶん移動する
        vx +=xgravity;
        vy += ygravity;          // 速度のy成分に重力加速度を加算する
        y  += vy;
        if (x < d / 2) {
            vx = - vx * elas;
            x = d / 2;
        } else if (x > width - d / 2) {
            vx = - vx  * elas;
            x = width - d / 2;
            changeGravity();
        }
        if (y > height - d / 2) {
            vy = - vy * elas;
            y = height - d / 2;
            changeGravity();
        } else if (y < d / 2) {
            vy = - vy * elas;
            y = d / 2;
        }
    }
    void changeGravity(){
        hue+=180;
        if(hue>=hueMax){
            hue=0;
        }
        if(xgravity>ygravity){
            ygravity = xgravity;
            xgravity = 0;
        }else{
            xgravity = ygravity;
            ygravity = 0;
        }
    }
}