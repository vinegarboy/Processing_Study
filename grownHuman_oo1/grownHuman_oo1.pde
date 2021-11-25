final float fps = 60;
final int x = 200;
final int y = 320;
Human someone;

void setup() {
    size(400, 400);
    frameRate(fps);
    noStroke();
    colorMode(HSB, 360, 100, 100);
    someone = new Human(40,20,25,240,140,50,0.004);
}

void draw() {
    background(0, 0, 100);
    someone.grown();
    someone.draw();
}



class Human {
    float h;
    float w;
    float d;
    float he;
    float we;
    float de;
    float growthRate;
    Human(float _h0,float _w0,float _d0,float _he,float _we,float _de,float _growthRate){
        h=_h0;
        w=_w0;
        d=_d0;
        he = _he;
        we=_we;
        de=_de;
        growthRate=_growthRate;
    }
    void grown(){
        if ( h < he )
            h = h * (1.0 + growthRate);
        if ( w < we )
            w = w * (1.0 + growthRate * 0.8);
        if ( d < de )
            d = d * (1.0 + growthRate * 0.5);
    }
    void draw() {
        fill(35, 60, 100);
        ellipse(x, y - h, d, d);
        fill(220, 87, 100);
        ellipse(x, y - h / 2 + d / 2, w, h);
    }
}