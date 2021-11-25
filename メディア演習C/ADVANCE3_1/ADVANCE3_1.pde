float deg=0;
final int maxb = 10;

void setup(){
    size(640, 480, P3D);
}

void draw(){
    background(127, 127, 127);
    camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
    axis(100);
    deg++;
    boxes(40);
}

void boxes(float si){
    pushMatrix();
    rotateY(radians(deg));
    boxandaxis(si);
    popMatrix();
    pushMatrix();
    for(int i = 1;i<maxb;i++){
        rotateY(radians(deg));
        translate(si-(si/maxb)*i,0,0);
        boxandaxis(si-(si/maxb)*i);
    }
    popMatrix();
    pushMatrix();
    for(int i = 1;i<maxb;i++){
        rotateY(radians(deg));
        translate(-(si-(si/maxb)*i),0,0);
        boxandaxis(si-(si/maxb)*i);
    }
    popMatrix();
    pushMatrix();
    for(int i = 1;i<maxb;i++){
        rotateY(radians(deg));
        translate(0,0,si-(si/maxb)*i);
        boxandaxis(si-(si/maxb)*i);
    }
    popMatrix();
    pushMatrix();
    for(int i = 1;i<maxb;i++){
        rotateY(radians(deg));
        translate(0,0,-(si-(si/maxb)*i));
        boxandaxis(si-(si/maxb)*i);
    }
    popMatrix();
}

void axis(float l){
    stroke(255, 0, 0);
    line(0, 0, 0, l, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, l, 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, l);
}

void boxandaxis(float si){
    axis(30);
    stroke(0, 0, 0);
    box(si);
}