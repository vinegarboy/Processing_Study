int x=512;
int _x =x-50;
int y=512;
int _y = y/2;
int i = 0,waveamp=256;
void settings(){
    size(x, y);
}

void setup() {
}

void draw(){
    background(255,255,255);
    fill(0,0,0);
    i++;
    if(i>360){
        i=0;
    }
    _y=(int)((y/2)-50+waveamp*sin(radians(i)));
    if(_y>height){
        _y=height-50;
    }else if(_y<0){
        _y=0;
    }
    rect(_x,_y , 50, 50);
}