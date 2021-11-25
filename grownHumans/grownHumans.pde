final float fps = 60;
final int allhuman=5;
Human[] someones = new Human[allhuman];
final int aY = 320;

void setup() {
    size(700, 400);
    frameRate(fps);
    noStroke();
    colorMode(HSB, 360, 100, 100);
    for(int i =0;i<someones.length;i++){
        someones[i] = new Human(((width-40)/someones.length)*i+40,aY,40,20,25,random(200, 280),random(100,180),random(30, 70),0.004,random(0,360));
    }
}

void draw() {
    background(0, 0, 100);
    for(int i =0;i<someones.length;i++){
        someones[i].grown();
        someones[i].draw();
    }
}



class Human {
    int x;
    int y;
    float hsb_h;
    float h;
    float w;
    float d;
    float he;
    float we;
    float de;
    float growthRate;
    Human(int _x,int _y,float _h0,float _w0,float _d0,float _he,float _we,float _de,float _growthRate,float _hh){
        x=_x;
        y=_y;
        h=_h0;
        w=_w0;
        d=_d0;
        he = _he;
        we=_we;
        de=_de;
        growthRate=_growthRate;
        hsb_h = _hh;
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
        fill(hsb_h, 100, 100);
        ellipse(x, y - h / 2 + d / 2, w, h);
    }
}