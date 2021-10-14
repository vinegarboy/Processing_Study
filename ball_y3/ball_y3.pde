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
    colorMode( HSB, height-d/2 , 100 , 100 );
}

void draw() {
    vy += gravity;
    y += vy;
    if(height - d/2<=y){
        vy = - vy * elas;
        y = height - d/2;
    }
    background(0,0,100);
    fill(height-d/2-y,100,100);
    ellipse(x, y, d, d);
}