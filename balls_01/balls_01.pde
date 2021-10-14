final float gravity = 9.8 / 60;
final int nBalls = 6;
float y0=0,d=40,vy0=4,elas = 0.98;
float[][] balls = new float[nBalls][4];
int fps=60;

void setup() {
    size(480, 480);
    noStroke();
    fill(0, 0, 0);
    frameRate(fps);
    for(int i =0;i<nBalls;i++){
        balls[i][0] = random(-50, 50);
        balls[i][1] = random(d/2,width-d/2);
        balls[i][2] = random(-4, 4);
        balls[i][3] = random(-4,4);
    }
    colorMode( HSB, 360 , 100 , 100 );
}

void draw() {
    background(0,0,100);
    for(int i = 0;i<nBalls;i++){
        fill(calcHue(balls[i][2],balls[i][3]),100,100);
        balls[i] = boundBall(balls[i]);
        ellipse(balls[i][0], balls[i][1], d, d);
    }
}

float[] boundBall(float[] _ball0){
    float[] ball1 = _ball0;
    ball1[3] += gravity;
    ball1[1] += ball1[3];
    ball1[0] += ball1[2];
    if(height - d/2<=ball1[1]||ball1[1]<=d/2){
        ball1[3] = - ball1[3] * elas;
        if(ball1[1] > height-d/2){
            ball1[1] = height - d/2;
        }else{
            ball1[1] = d/2;
        }
    }
    if(d/2 >= ball1[0]||width-d/2<=ball1[0]){
        ball1[2] = -ball1[2]*elas;
        if(ball1[0] >width/2){
            ball1[0] = width-d/2;
        }else{
            ball1[0] = d/2;
        }
    }
    return ball1;
}

float calcHue(float _vx,float _vy){
    float re,v = sqrt(_vx * _vx + _vy * _vy);
    if(v <0){
        re = -v*60;
    }else{
        re = v*60;
    }
    if(re>360)
        re-=360;
    return re;
}