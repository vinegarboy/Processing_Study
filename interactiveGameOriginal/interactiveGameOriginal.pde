int mode =0,level=0;
PImage glass,bird_L,reticle,bird_R;
import ddf.minim.*;
String tex_path;
int time = 0,score=0,tama = 0,tm = 6;
boolean played = false;
AudioSnippet spk1;
Birds[] birds;
Minim minim = new Minim(this);

void setup() {
    tex_path  = sketchPath()+"\\tex\\";
    glass=loadImage(tex_path+"glass.png");
    bird_L = loadImage(tex_path+"birdL.png");
    bird_R = loadImage(tex_path+"birdR.png");
    reticle = loadImage(tex_path+"reticle.png");
    spk1 = minim.loadSnippet(sketchPath()+"\\Sounds\\HandGun.mp3");
    noCursor();
    frameRate(60);
    size(800, 600);
}

void draw() {
    switch (mode) {
        case 0 :
            title();
        break;
        case 1 :
            menu();
        break;
        case 2 :
            playscene();
        break;
        case 3:
            result();
        break;
    }
    image(reticle, mouseX-100, mouseY-100, 200, 200);
}

void title(){
    background(0,0,0);
    textSize(64);
    text("ShotBirds!!",0,64);
    textSize(48);
    text("Click To Start!!",width/3,height*2/3);
    if(mousePressed){
        mode=1;
    }
}

void menu(){
    background(0,0,0);
    fill(0,0,200);
    rect(0,0, width/3,height);
    fill(0,200,0);
    rect(width/3,0, width/3,height);
    fill(200,0,0);
    rect(width*2/3,0, width/3,height);
    fill(255,255,255);
    textSize(64);
    text("Select Difficulty!!",0,64);
    textSize(48);
    text("Easy",0,height*2/3);
    text("Normal",width/3,height*2/3);
    text("Hard",width*2/3,height*2/3);
}

void playscene(){
    time++;
    if(!played){
        played = true;
        time = 0;
        score = 0;
    }
    background(36,139,255);
    image(glass, -50, height-150, width+100, 200);
    textSize(36);
    text("Time:"+((1+level)*3600-time)+"\nScore:"+(score)+"\n残弾数:"+tama,0,36);
    rect(width-100, 0, 100,100);
    if(time >= 3600*(1+level)){
        mode = 3;
        played=false;
    }
    for(int i = 0;i<birds.length;i++){
        birds[i].move();
        birds[i].draw();
    }
}

void result(){
    background(0,0,0);
    textSize(128);
    text("Result",width/2-(64*4),64*2);
    textSize(48);
    text("Score:"+score,width/2-(32*4),64*4);
    text("Click Screen to menu!!",width/2-(64*5),64*5);
}

void mousePressed() {
    spk1.rewind();
    spk1.play();
    if(mode==1){
        if(mouseX<width/3){
            mode=2;
            level=0;
            birds = new Birds[2];
        }else if(mouseX<width*2/3){
            mode=2;
            level=1;
            birds = new Birds[5];
        }else if(mouseX<width){
            mode=2;
            level=2;
            birds = new Birds[10];
        }
        tm = 12-level;
        tama = tm;
        for(int i = 0;i<birds.length;i++){
            birds[i] = new Birds();
            birds[i].init();
        }
    }
    if(mode == 2){
        if(mouseX>width-100&&mouseY<100){
            tama++;
            if(tm<tama){
                tama=tm;
            }
        }else if(tama>0){
            for(int i = 0;i<birds.length;i++){
                birds[i].collision();
            }
            tama--;
        }
    }
    if(mode==3){
        mode = 1;
    }
}
void stop(){
    spk1.close();
    minim.stop();
    super.stop();
}

class Birds{
    float x,y,v;
    boolean turn;
    void init(){
        v=random(level+1, level+2);
        if(int(random(10))>=5){
            x=width-100;
            turn = false;
        }else{
            turn = true;
            x=-100;
        }
        y=height-random(200);
    }
    void move(){
        if(turn){
            x+=v*v;
        }else{
            x-=v*v;
        }
        y-=v;
        if(y<0||(x>width+100||x<-100)){
            this.init();
        }
    }
    void draw(){
        if(turn){
            image(bird_R, x, y, 100,100);
        }else{
            image(bird_L, x, y, 100,100);
        }
    }
    void collision(){
        if((mouseX>x&&mouseX<x+100)&&(mouseY>y&&mouseY<y+100)){
            this.init();
            score++;
        }
    }
}