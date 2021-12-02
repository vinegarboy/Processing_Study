int deg = 0;
Spot[] sp = new Spot[8];
float xr=0,yr=0,zr=0,dr=0.01;
void setup()
{
    size(640, 480, P3D);
    frameRate(60);
    for(int i = 0;i<sp.length;i++){
        sp[i] = new Spot();
        sp[i].init();
    }
}

void draw(){
    background(127, 127, 127);
    camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
    axis(100);
    for(int i = 0;i<sp.length;i++){
        sp[i].draw();
    }
    noStroke();
    deg++;
    Floa(30,300);
}

void axis(float l){
    stroke(255, 0, 0);
    line(0, 0, 0, l, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, l, 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, l);
}

void Floa(int di,int si){
    fill(255,255,255);
    for(int x = -si;x<si;x+=di){
        for (int y = -si; y < si; y+=di) {
            pushMatrix();
            translate(x, 0, y);
            box(di, 1, di);
            popMatrix();
            pushMatrix();
            translate(x, y, -si);
            box(di, di, 1);
            popMatrix();
            pushMatrix();
            translate(-si, x, y);
            box(1, di, di);
            popMatrix();
            pushMatrix();
            translate(x, y, si);
            box(di, di, 1);
            popMatrix();
            pushMatrix();
            translate(si, x, y);
            box(1, di, di);
            popMatrix();
        }
    }
}

class Spot{
    int r,g,b,degr,rotes;
    int y = -20;
    float rx,ry,rz;
    void init(){
        r=int(random(0, 255));
        g=int(random(0, 255));
        b=int(random(0, 255));
        rx=random(-1,1);
        ry=random(-1,1);
        rz=random(-1,1);
        y=-int(random(20, 40));
        degr=int(random(0, 360));
        rotes=int(random(0, 360));
    }
    void draw(){
        pushMatrix();
        rotateY(radians(deg+rotes));
        spotLight(r,g,b, 0, y, 0, rx,ry,rz, radians(degr), 3);
        popMatrix();
    }
}
