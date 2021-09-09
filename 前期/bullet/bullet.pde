int x=512;
int g = 0;
int y=512;
int _x=0,_y=0,speed = 10;
boolean showflag = false;
void settings(){
    size(x, y);
}

void setup() {
}

void draw(){
    background(255,255,255);
    fill(128,128,128);
    rect(mouseX-25, mouseY-25, 50, 50);
    if(showflag){
        _x+=speed;
        fill(255,241,0);
        rect(_x, _y-15, 70, 30);
        if(x+70<_x){
            showflag = false;
        }
    }
    if(mousePressed==true){
        if(!showflag){
            _x = mouseX;
            _y = mouseY;
            fill(255,241,0);
            rect(_x, _y-15, 70, 30);
            showflag = true;
        }
    }
}