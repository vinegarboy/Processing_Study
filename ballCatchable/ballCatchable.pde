final int X = 0;
final int Y = 1;
final int VX = 2;
final int VY = 3;
final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 15;
final int fps = 60;
final float gravity = 9.8 / fps;
final float elas = 0.98;
final float d = 40;
final float hueMax = 360.0;
float[] ball0;

void setup() {
    frameRate(fps);
    size(480, 480);
    noStroke();
    colorMode(HSB, hueMax, 100, 100);
    fill(0, 0, 0);
    ball0 = new float[4];
    ball0[X]  = random(d / 2, width - d / 2);
    ball0[Y]  = random(d / 2, height / 5);
    ball0[VX] = random(vx0min, vx0max);
    ball0[VY] = random(vy0min, vy0max);
}
void draw() {
    background(0, 0, 100);
    if((ball0[X]-mouseX)*(ball0[X]-mouseX)+(ball0[Y]-mouseY)*(ball0[Y]-mouseY)-(d*d)/4<=0){
        fill(0,100,100);
    }else{
        fill(180,100,100);
        boundBall(ball0);
    }

    ellipse(ball0[X], ball0[Y], d, d);
}


void boundBall(float[] ball) {
    ball[X]  += ball[VX];
    ball[VY] += gravity;
    ball[Y]  += ball[VY];
    if (ball[X] < d / 2) {
        ball[VX] = - ball[VX] * elas;
        ball[X] = d / 2;
    } else if (ball[X] > width - d / 2) {
        ball[VX] = - ball[VX]  * elas;
        ball[X] = width - d / 2;
    }
    if (ball[Y] > height - d / 2) {
        ball[VY] = - ball[VY] * elas;
        ball[Y] = height - d / 2;
    } else if (ball[Y] < d / 2) {
        ball[VY] = - ball[VY] * elas;
        ball[Y] = d / 2;
    }
}