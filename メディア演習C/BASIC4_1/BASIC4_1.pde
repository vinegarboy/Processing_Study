int deg = 0;
void setup()
{
    size(640, 480, P3D);
    frameRate(60);
}

void draw(){
    background(127, 127, 127);
    camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
    axis(100);
    noStroke();
    RGBLightning(40,radians(deg));
    deg++;
    Floa(30);
}

void axis(float l){
    stroke(255, 0, 0);
    line(0, 0, 0, l, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, l, 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, l);
}

void Floa(int di){
    for(int x = -200;x<200;x+=di){
        for (int y = -200; y < 200; y+=di) {
            pushMatrix();
            translate(x, 0, y);
            box(di, 1, di);
            popMatrix();
        }
    }
}


void RGBLightning(float distance,float rad){
    spotLight(255,0,0, distance*cos(rad),-50,distance*sin(rad),0,1,0, 1, 2);
    spotLight(0,255,0, distance*cos(rad+radians(120)),-50,distance*sin(rad+radians(120)),0,1,0, 1, 2);
    spotLight(0,0,255, distance*cos(rad+radians(240)),-50,distance*sin(rad+radians(240)),0,1,0, 1, 2);
}
