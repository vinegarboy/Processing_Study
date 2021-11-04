final float gravity = 9.8 / 60;
float y,y0=0,vy,x=100,d=40,vy0=4;
int fps=60;

void setup() {
    size(200, 480);
    noStroke();
    fill(0, 0, 0);
    y = y0;
    vy = vy0;
    frameRate(fps);
}

void draw() {
    vy += gravity;
    y += vy;
    background(255, 255, 255);
    ellipse(x, y, d, d);
}