int x=512;
int y=512;
void settings(){
    size(x, y);
}

void setup() {
    int m = 9;
    background(255,255,255);
    for(int i=1;i<m;i++){
        line(0, y-((i-1)*(y/m)), i*(x/m), 0);
        line(i*(x/m), y, x, y-(i*(y/m)));
    }
}

void draw(){

}