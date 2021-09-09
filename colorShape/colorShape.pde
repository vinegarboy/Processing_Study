float r = 0;
int theta;
int dTheta = 5;
float rad;
int d = 8;
int shiki,dShiki=5;
float x, y;
int dr=1;


void settings(){
    size(400, 400);
}

void setup() {
    noStroke();
    background(255, 255, 255);
    fill(0, 0, 0);
    colorMode(HSB, 360, 100, 100);
}

void draw(){
    rad = radians(theta);
    r+=dr;
    x = r*cos(rad);
    y = r*sin(rad);
    fill(shiki, 100, 100);
    ellipse(x + width/2, y + height/2, d, d);
    theta+=dTheta;
    shiki += dShiki;
    if(shiki>360){
        dShiki = int(random(1,5));
        shiki = 0;
    }
    if(r>150||r<0){
        dr=-dr;
    }
}