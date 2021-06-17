int x=550,y=550,bw=40,bh=40,_x=(x/2)-bw,_y=y/20,sx=5,sy=10;

void settings(){
    size(x,y);
}

void setup(){
}

void draw(){
    background(255,255,255);
    _x+=sx;
    _y+=sy;
    fill(0,0,0);
    ellipse(_x, _y, bw, bh);
    if(_x>x-(bw/2)||_x<0+(bw/2)){
        sx=-sx;
    }
    if(_y>y-(bh/2)||_y<0+(bh/2)){
        sy=-sy;
    }
}