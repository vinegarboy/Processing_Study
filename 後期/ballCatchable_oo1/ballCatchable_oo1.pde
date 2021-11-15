final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 15;
final float fps = 60;
final float gravity = 9.8 / fps;
final float elas = 0.98;
final float d = 40;
final float hueMax = 360.0;

Ball ball0;

void setup() {
    frameRate(fps);
    size(480, 480);
    noStroke();
    colorMode(HSB, hueMax, 100, 100);
    fill(0, 0, 0);
    ball0 = new Ball();
    ball0.x  = random(d / 2, width - d / 2);
    ball0.y  = random(d / 2, height / 5);
    ball0.vx = random(vx0min, vx0max);
    ball0.vy = random(vy0min, vy0max);
}

void draw() {
    background(0, 0, 100);
    fill(calcHue(ball0.vx, ball0.vy), 100, 100);
    ellipse(ball0.x, ball0.y, d, d);
    ball0.BoundBall();
}

float calcHue(float vx, float vy) {
    return (sqrt(vx * vx + vy * vy) * 16) % hueMax;
}

class Ball{
    float x,y,vx,vy;
    void BoundBall() {
        if((x-mouseX)*(x-mouseX)+(y-mouseY)*(y-mouseY)-(d*d)/4>0){
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
            } else if (y < d / 2) {
                vy = - vy * elas;
                y = d / 2;
            }
        }
    }
}