final float radius = 150.0;
final float dTheta = 30;
final float m = 100.0;
int max_rect = 3;
float[] theta = new float[max_rect],x = new float[max_rect],y = new float[max_rect];

void setup() {
    size(400, 400);
    noStroke();
    colorMode(HSB, 360, 100, 100);
    for(int i = 0;i<x.length;i++) {
        theta[i] = i*dTheta;
    }
}

void draw(){
    background(0,0,100);
    for(int i = 0;i<x.length;i++) {
        theta[i] = theta[i]+random(0,10);
        if(theta[i]>360){
            theta[i]-=360;
        }
        x[i] = radius * cos(radians(theta[i]));
        y[i] = -radius * sin(radians(theta[i]));
        drawSquare(x[i] + 200, y[i] + 200, m, theta[i]);
    }
}

void drawSquare(float x, float y, float m, float h) {
    fill(h, 100, 100);
    rect(x - m / 2, y - m / 2, m, m);
}