int x =600,y=600,rx=x/2,ry=y-60;

void settings(){
    size(x,y);
}

void setup(){
}

void draw(){
    background(0,0,0);
    if(keyPressed&&key==CODED&&keyCode==RIGHT){
        rx+=10;
        if(rx>x-80){
            rx=x-80;
        }
    }
    if(keyPressed&&key==CODED&&keyCode==LEFT){
        rx-=10;
        if(rx <0){
            rx=0;
        }
    }
    rect(rx,ry,80,40);
}