
final float gravity = 9.8 / 60;
float y0=0,d=40,vy0=4,elas = 0.98;
float[] ball0 = {100,y0,4,vy0};
int fps=60;

void setup() {
    size(480, 480);
    noStroke();
    fill(0, 0, 0);
    ball0[1] = y0;
    ball0[3] = vy0;
    frameRate(fps);
    colorMode( HSB, 360 , 100 , 100 );
}

void draw() {
    ball0 = boundBall(ball0);
    background(0,0,100);
    fill(calcHue(ball0[2],ball0[3]),100,100);
    ellipse(ball0[0], ball0[1], d, d);
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