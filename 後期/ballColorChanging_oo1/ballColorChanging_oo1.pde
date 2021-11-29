final int fps = 60;
final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 8;
final float hueMax = 360.0;


Ball aBall;

void setup() {
    frameRate(fps);
    size(480, 480);
    noStroke();
    colorMode(HSB, hueMax, 100, 100);
    fill(0, 0, 0);
    aBall = new Ball();
}

void draw() {
    background(0, 0, 100);
    aBall.move();
    aBall.draw();
}

class Ball {
    final float gravity = 9.8 / fps;
    final float elas = 0.98;
    float d=40;
    final float dH = 30;
    float x;
    float y;
    float vx;
    float vy;
    float h = 0;
    int bounds = 0;
    Ball(float _x,float _y,float _vx,float _vy){
        x = _x;
        y=_y;
        vx=_vx;
        vy=_vy;
    }
    Ball(){
        x = random(d / 2, width - d / 2);
        y=random(d / 2, height / 5);
        vx=random(vx0min, vx0max);
        vy=random(vy0min, vy0max);
    }
    void move() {
        x  += vx;
        vy += gravity;
        y  += vy;
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
                bounds += 1;
            if (bounds >= 4) {
                bounds = 0;
                h += dH;
                if (h > hueMax) {
                    h -= hueMax;
                }
            }
        } else if (y < d / 2) {
            vy = - vy * elas;
            y = d / 2;
        }
    }
    void draw() {
        fill(h, 100, 100);
        ellipse(x, y, d, d);
    }
}