int x=512;
int y=512;
void settings() {
    size(x, y);
}
void setup(){
    fill(0, 0, 255, 80);
    for (int i = 0; i < 6; i++) {
        rect(i*20,i*20,x-(40*i) , y-(40*i));
    }
}

void draw(){

}