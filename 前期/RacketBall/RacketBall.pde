int x=550,y=550,bw=40,bh=40,_x=(x/2)-bw,_y=80,rx=x/2,ry=y-60,score=0;
float sx=random(-10, 10),sy=random(-10,10);

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
    fill(180,40,240);
    rect(rx,ry,80,40);
    fill(0,0,0);
    textSize(20);
    text("Score:"+score,x-150 ,20);
    if((_x>x-(bw/2)||_x<0+(bw/2))){
        sx=-sx;
        if(_x+sx>x-(bw/2)){
            _x = x-(bw/2)-1;
        }else if(_x+sx<0+(bw/2)){
            _x = (bw/2)+1;
        }
    }
    if(_y>y-(bh/2)||_y<0+(bh/2)){
        sy=-sy;
        if(_y>y-(bh/2)){
            score--;
        }
        if(_y+sy>y-(bh/2)){
            _y = y-(bh/2)-1;
        }else if(_y+sy<0+(bh/2)){
            _y=(bh/2)+1;
        }
    }
    if((_x>rx&&_x<rx+80)&&(_y+bh/2>=ry&&_y+bh/2<ry+40)){
        sy=-sy+random(-3,3);
        sx=-sx+random(-3,3);
        score++;
    }
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
}