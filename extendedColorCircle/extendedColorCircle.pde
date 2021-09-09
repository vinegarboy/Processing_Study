int r = 150;
int theta;
int dTheta = 5;
float rad;
int d = 8;
int shiki,dShiki=5;
float x, y;


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
    x = r * cos(rad);
    y = -r * sin(rad);
    fill(shiki, 100, 100);
    ellipse(x + width/2, y + height/2, d, d);
    theta+=dTheta;
    shiki += dShiki;
    if(shiki>360){
        dShiki = int(random(1,5));
        print(dShiki+"\n");
        shiki = 0;
    }
}