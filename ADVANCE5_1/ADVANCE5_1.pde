PImage img;
MQOModel model;
MQOModel enemy;
int move;
float x = 0,ex = 0,ez = 1000;
final int moveSpeed = 5;
boolean gameover = false;

void setup(){
    size(640, 480, P3D);
    img = loadImage("road.png");
    model = new MQOModel("car.mqo");
    enemy = new MQOModel("car.mqo");
    textureWrap(REPEAT);
}

void draw(){
    background(127, 127, 127);
    camera(0, -100, 150, 0, 0, 0, 0, 1, 1);
    if(!gameover){
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
        text("Score:"+(-move/10)+"m", 0, -50, 0);
        pushMatrix();
        if(-move/10 > 50){
            scale(0.1,0.1,0.1);
            rotateY(PI);
            translate(ex, 0, ez);
            ez-=10;
            enemy.draw();
            if(ez < -1000){
                ez=1000;
                ex = random(-500, 500);
            }
        }
        popMatrix();
        if((200>ez&&ez>-200)&&(ex>x-120&&ex<x+120)){
            gameover = true;
        }
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
    }else{
        text("GameOver\nScore:"+(-move/10)+"m", -30, -50, 30);
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