
final float gravity = 9.8 / 60;
float y,y0=0,vy,x=100,d=40,vy0=4,elas = 0.98,vx = 4;
int fps=60;

void setup() {
    size(480, 480);
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
    x+= vx;
    if(height - d/2<=y||y<=d/2){
        vy = - vy * elas;
        if(y > height-d/2){
            y = height - d/2;
        }else{
            y = d/2;
        }
    }
    if(d/2 >= x||width-d/2<=x){
        vx = -vx*elas;
        if(x >width/2){
            x = width-d/2;
        }else{
            x = d/2;
        }
    }
    background(0,0,100);
    fill(calcHue(vx,vy),100,100);
    ellipse(x, y, d, d);
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