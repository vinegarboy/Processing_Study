int x=512;
int _x =x-50;
int y=512;
int _y = y/2;
int i = 0,waveamp=x/2;
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
    _y=(int)((((y+50)/2)+waveamp*sin(radians(i)))-50);
    rect(_x,_y , 50, 50);
}