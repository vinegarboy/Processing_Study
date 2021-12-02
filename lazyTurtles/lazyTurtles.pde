final int amount = 3;
Tartle[] tartles = new Tartle[amount];

void setup() {
    size(512,512);
    colorMode(HSB, 360, 100, 100);
    for(int i =0;i<tartles.length;i++){
        tartles[i] = new Tartle((width/3)*i+80,height+int(random(-50,50)),50);
    }
}

void draw() {
    background(0,0,100);
    for(int i =0;i<tartles.length;i++){
        if(tartles[i].touch()){
            tartles[i].walk();
        }
        tartles[i].draw();
    }
}

class Tartle{
    float x,y,sizes;
    Foot foots;
    Shell body;
    Head head;
    Tartle(float _x,float _y,float si){
        body = new Shell(si*2);
        foots = new Foot(si);
        head = new Head(si);
        x = _x;
        y=_y;
        sizes = si;
    }
    void walk(){
        y-=0.5;
        if(sizes*3/2>y){
            y = sizes*3/2;
        }
    }
    void draw(){
        foots.draw(x,y);
        head.draw(x,y);
        body.draw(x,y);
    }
    boolean touch(){
        boolean ret = false;
        ret = foots.touch(x,y);
        if(!ret){
            ret = head.touch(x,y);
        }
        if(!ret){
            ret = body.touch(x,y);
        }
        return ret;
    }
}

class Foot{
    float siz;
    Foot(float si){
        siz = si;
    }
    void draw(float x,float y){
        fill(50,50,70);
        ellipse(x+siz,y-siz/2, siz,siz);
        ellipse(x-siz,y-siz/2, siz,siz);
        ellipse(x+(siz*2)/3,y+(siz*2)/3, siz,siz);
        ellipse(x-(siz*2)/3,y+(siz*2)/3, siz,siz);
    }
    boolean touch(float x,float y){
        if(dist(x+siz,y-siz/2, mouseX, mouseY)<siz||dist(x-siz,y-siz/2, mouseX, mouseY)<siz||dist(x-(siz*2)/3,y+(siz*2)/3, mouseX, mouseY)<siz||dist(x+(siz*2)/3,y+(siz*2)/3, mouseX, mouseY)<siz){
            return true;
        }else{
            return false;
        }
    }
}

class Shell{
    float siz;
    Shell(float si){
        siz = si;
    }
    void draw(float x,float y){
        fill(150,50,50);
        ellipse(x,y,siz,siz);
    }
    boolean touch(float x,float y){
        if(dist(x,y, mouseX, mouseY)<siz){
            return true;
        }else{
            return false;
        }
    }
}

class Head{
    float siz;
    Head(float si){
        siz = si;
    }
    void draw(float x,float y){
        fill(50,50,70);
        ellipse(x, y-siz, siz, siz);
    }
    boolean touch(float x,float y){
        if(dist(x, y-siz, mouseX, mouseY)<siz){
            return true;
        }else{
            return false;
        }
    }
}