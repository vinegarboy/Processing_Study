int x=512;
int y=512;
void settings(){
    size(x, y);
}

void setup() {
    background(255,255,255);
    int m=5;
    fill(0, 0,255);
    noStroke();
    for(int i=0;i<m;i++){
        rect(i*(x/m), i*(y/m), (x/m), (y/m));
    }
}

void draw(){

}