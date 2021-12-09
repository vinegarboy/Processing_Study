PImage img;
MQOModel model;
int move;
float x = 0;
final int moveSpeed = 5;

void setup(){
    size(640, 480, P3D);
    img = loadImage("road.png");
    model = new MQOModel("car.mqo");
    textureWrap(REPEAT);
}

void draw(){
    background(127, 127, 127);
    camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
    axis(100);
    noStroke();
    beginShape(QUADS);
    texture(img);
    vertex(50, 0, -150, 0, move);
    vertex(-50, 0, -150, 200, move);
    vertex(-50, 0, 150, 200, 200+move);
    vertex(50, 0, 150, 0, 200+move);
    endShape();
    pushMatrix();
    scale(0.1,0.1,0.1);
    translate(x, 0, 0);
    rotateY(PI);
    model.draw();
    popMatrix();
    move-=3;
    if (keyPressed&& key == CODED){
        if(keyCode==LEFT){
            x-=moveSpeed;
            if(x<-500){
                x = -500;
            }
        }
        if(keyCode==RIGHT){
            x+=moveSpeed;
            if(x>500){
                x = 500;
            }
        }
    }
}

void axis(float l){
    stroke(255, 0, 0);
    line(0, 0, 0, l, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, l, 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, l);
}