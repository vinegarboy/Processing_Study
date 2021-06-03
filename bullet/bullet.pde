public class bullets{
    int _x,_y;
    public void Set(int a,int b) {
        _x = a;
        _y = b;
    }
    public void Show() {
        fill(255,241,0);
        rect(_x, _y, 70, 30);
        _x++;
    }
}

int x=512;
int g = 0;
int y=512;
bullets[] bl = new bullets[x];
void settings(){
    size(x, y);
    for(int i =0;i<bl.length;i++){
        bl[i] = new bullets();
    }
}

void setup() {
}

void draw(){
    background(255,255,255);
    if(mousePressed==true){
        bl[g].Set(mouseX,mouseY);
        g++;
        if(g>=bl.length){
            g=0;
        }
    }
    for(int i =0;i<bl.length;i++){
        bl[i].Show();
    }
}