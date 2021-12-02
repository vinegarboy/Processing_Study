Sun theSun;

void setup() {
    size(480, 480);
    noStroke();
    colorMode(HSB, 360, 100, 100);
    theSun = new Sun(50, width / 2, height / 2);
}

void draw() {
    background(0, 0, 100);
    theSun.drawFigure();
    theSun.move();
}

class Sun {
    float d;
    float x;
    float y;
    Earth theEarth;
    Sun(float d, float x, float y) {
        this.d = d;
        this.x = x;
        this.y = y;
        theEarth = new Earth(0.6 * d, 150);
    }
    void move() {
        theEarth.move(x, y);
    }
    void drawFigure() {
        theEarth.drawFigure();
        fill(30, 100, 100);
        ellipse(x, y, d, d);
    }
}

class Earth{
    float d,dis,deg=0,x=0,y=0;
    Earth(float _d , float _dis){
        d = _d;
        dis = _dis;
        x = dis;
        y = dis;
    }
    void move(float _x,float _y){
        deg-=0.03;
        x =_x+ dis * cos(deg);
        y =_y+ dis * sin(deg);
    }
    void drawFigure(){
        fill(240,100,100);
        ellipse(x, y, d, d);
    }
}