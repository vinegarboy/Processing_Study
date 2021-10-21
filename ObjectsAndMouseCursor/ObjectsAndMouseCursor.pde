final float d = 40;
final int fps = 60;
final int max_ball=5000;
final float gravity =9.8/fps;
final float elas = 0.98;
int mKey=0;
float[][] balls = new float[max_ball][];

void setup() {
    frameRate(fps);
    size(480, 480);
    noStroke();
    colorMode(HSB, 360, 100, 100);
    fill(0, 0, 0);
    balls = MakeBall(balls);
}

void draw(){
    background(0,0,100);
    for(int i =0;i<mKey;i++){
        if((balls[i][0]-mouseX)*(balls[i][0]-mouseX)+(balls[i][1]-mouseY)*(balls[i][1]-mouseY)-(d*d)/4<=0){
            fill(0,100,100);
            balls = MakeBall(balls);
        }else{
            fill(180,100,100);
        }
        BoundBall(balls[i]);
        ellipse(balls[i][0], balls[i][1], d, d);
    }
}

void BoundBall(float[] ball) {
    ball[0]  += ball[2];
    ball[3] += gravity;
    ball[1]  += ball[3];
    if (ball[0] < d / 2) {
        ball[2] = - ball[2] * elas;
        ball[0] = d / 2;
    } else if (ball[0] > width - d / 2) {
        ball[2] = - ball[2]  * elas;
        ball[0] = width - d / 2;
    }
    if (ball[1] > height - d / 2) {
        ball[3] = - ball[3] * elas;
        ball[1] = height - d / 2;
    } else if (ball[1] < d / 2) {
        ball[3] = - ball[3] * elas;
        ball[1] = d / 2;
    }
}

float[][] MakeBall(float[][] ball){
    if(mKey<max_ball){
        float[] f = {random(0,width),random(0,-50),random(0,50),random(0,50)};
        ball[mKey]= f;
        mKey++;
    }
    return ball;
}