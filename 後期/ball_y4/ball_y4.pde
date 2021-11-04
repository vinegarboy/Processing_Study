final float gravity = 9.8 / 60;
float y,y0=0,vy,x=100,d=40,vy0=4,elas = 0.98;
int fps=60;

void setup() {
    size(200, 480);
    noStroke();
    fill(0, 0, 0);
    y = y0;
    vy = vy0;
    frameRate(fps);
    colorMode( HSB, 360 , 100 , 100 );
}

void draw() {
    vy += gravity;
    y += vy;
    if(height - d/2<=y){
        vy = - vy * elas;
        y = height - d/2;
    }
    background(0,0,100);
    fill(calcHue(vy),100,100);
    ellipse(x, y, d, d);
}

float calcHue(float v){
    float re;
    if(v <0){
        re = -v*60;
    }else{
        re = v*60;
    }
    if(re>360)
        re-=360;
    return re;
}