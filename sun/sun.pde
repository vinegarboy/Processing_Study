int x=512;
int y=512;
void settings() {
    size(x, y);
}
void setup(){
    smooth();
    noStroke();
    background(205,225,255);
    int m = 120;
    for(int i = 0;i<=m;i++){
        fill(255, i*(255/(m)), i*(255/(m)), 80);
        ellipse(x/2, y/2,x-((i+10)*(x/m)),y-((i+10)*(y/m)));
    }
}

void draw(){

}