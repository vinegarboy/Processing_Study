final int X = 0;
final int Y = 1;
final int VX = 2;
final int VY = 3;
final float vx0min = -7;
final float vx0max = 5;
final float vy0min = 4;
final float vy0max = 15;
final float fps = 60.0;
final float gravity = 9.8 / 60;
final float elas = 0.98;
final float d = 40.0;
final float hueMax = 360.0;
final int nBalls = 6;

float[][] balls;

void setup() {
    frameRate(fps);
    size(480, 480);
    noStroke();
    colorMode(HSB, hueMax, 100, 100);
    fill(0, 0, 0);
    balls = new float[nBalls][4];
    for (int i = 0; i < balls.length; i++) {
        balls[i][X]  = random(d / 2, width - d / 2);
        balls[i][Y]  = random(d / 2, height / 5);
        balls[i][VX] = random(vx0min, vx0max);
        balls[i][VY] = random(vy0min, vy0max);
    }
}
void draw() {
    background(0, 0, 100);
    for(int i =0;i<balls.length;i++){
        if((balls[i][X]-mouseX)*(balls[i][X]-mouseX)+(balls[i][Y]-mouseY)*(balls[i][Y]-mouseY)-(d*d)/4<=0){
            fill(0,100,100);
        }else{
            fill(180,100,100);
            boundBall(balls[i]);
        }
        ellipse(balls[i][X], balls[i][Y], d, d);
    }

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