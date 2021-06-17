int x=250;
int y=850;
int rs = 30,bs = 20,gs = 40,ry=0,by=0,gy=0,ym=0;
void settings(){
    size(x,y);
}

void setup(){
}

void draw(){
    background(210,220,250);
    fill(200,122,123);//R
    rect((x/4)-20,ry,40,y-ry);
    fill(122,220,44);//G
    rect(((x/4)*2)-20,gy,40,y-gy);
    fill(122,122,221);//B
    rect(((x/4)*3)-20,by,40,y-by);
    if(ry>y||ry<0){
        rs=-rs;
    }
    if(gy>y||gy<0){
        gs=-gs;
    }
    if(by>y||by<0){
        bf=-bf;
    }
    ym=Math.min(Math.min(ry,gy),by);
    fill(157,180,250);
    rect(0,0,x,ym);
}