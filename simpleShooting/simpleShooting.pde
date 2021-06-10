int x=512;
int _x =x-50;
int y=512;
int _y = y/2;
int g = 0;
int i = 0,waveamp=256,_bx=0,_by=0,speed = 10,cf=0;
boolean showflag = false,showanime=false;
void settings(){
    size(x, y);
}

void setup() {
}

void draw(){
    background(255,255,255);
    i++;
    if(i>360){
        i=0;
    }
    _y=(int)((((y+50)/2)+waveamp*sin(radians(i)))-50);
    fill(128,128,128);
    rect(mouseX-25, mouseY-25, 50, 50);
    if(showflag){
        _bx+=speed;
        fill(255,241,0);
        rect(_bx, _by-15, 70, 30);
        if(x+70<_bx){
            showflag = false;
        }
        if((_bx>_x&&_bx<_x+50)&&(_by>_y&&_by<_y+50)){
            showflag=false;
            showanime=true;
        }
    }
    if(mousePressed==true&&!showflag){
        _bx = mouseX;
        _by = mouseY;
        fill(255,241,0);
        rect(_bx, _by-15, 70, 30);
        showflag = true;
    }
    if(showanime){
        if(cf%2==0){
            fill(0,0,0,90);
        }else{
            fill(0,0,0,50);
        }
        rect(_x,_y , 50, 50);
        cf++;
        if(cf>180){
            showanime=false;
            cf=0;
        }
    }else{
        fill(0,0,0);
        rect(_x,_y , 50, 50);
    }
}