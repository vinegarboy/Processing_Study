final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 15;
final float fps = 60;
final float gravity = 9.8 / fps;
final float elas = 0.98;
final float d = 40;
final float hueMax = 360.0;

Ball[] balls = new Ball[1];

void setup() {
    frameRate(fps);
    size(480, 480);
    noStroke();
    colorMode(HSB, hueMax, 100, 100);
    fill(0, 0, 0);
    for(int i = 0;i<balls.length;i++){
        balls[i] = new Ball();
        balls[i].x  = random(d / 2, width - d / 2);
        balls[i].y  = random(d / 2, height / 5);
        balls[i].vx = random(vx0min, vx0max);
        balls[i].vy = random(vy0min, vy0max);
        balls[i].hue = 0;
    }
}

void draw() {
    background(0, 0, 100);
    for(int i = 0;i<balls.length;i++){
        fill(balls[i].hue, 100, 100);
        ellipse(balls[i].x, balls[i].y, d, d);
        if((balls[i].x-mouseX)*(balls[i].x-mouseX)+(balls[i].y-mouseY)*(balls[i].y-mouseY)-(d*d)/4>0){
            balls[i].BoundBall();
        }else{
            balls[i].hue++;
            if(!balls[i].children){
                balls[i].children = true;
                Ball[] q = new Ball[balls.length+1];
                for(int n = 0;n<balls.length;n++){
                    q[n] = balls[n];
                }
                q[q.length-1] = new Ball();
                q[q.length-1].x  = random(d / 2, width - d / 2);
                q[q.length-1].y  = random(d / 2, height / 5);
                q[q.length-1].vx = random(vx0min, vx0max);
                q[q.length-1].vy = random(vy0min, vy0max);
                q[q.length-1].hue = 0;
                balls = q;
            }
        }
    }
}

class Ball{
    float x,y,vx,vy,hue;
    boolean children = false;
    void BoundBall() {
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