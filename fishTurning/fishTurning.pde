final int[] fish = new int[] {
  0, 0, 70, 30,
  -38, 0, 15, 25
};
final int bodyX = 0;
final int bodyY = 1;
final int bodyLength = 2;
final int bodyWidth =3;
final int finX = 4;
final int finY = 5;
final int finLength = 6;
final int finWidth = 7;
int x;
int y;
int vx;

void setup() {
    size(400, 400);
    noStroke();
    background(63, 63, 255);
    fill(63, 31, 31);
    x = 100;
    y = 200;
    vx = 1;
}

void draw() {
    background(63, 63, 255);
    fill(63, 31, 31);
    if(mouseX>x+fish[2]/2){
        x+=vx;
        fish[0] = 0;
    }else if(mouseX<x-fish[2]/2){
        x-=vx;
        fish[0] = 1;
    }
    if(fish[0] == 0){
        ellipse(x, y, fish[2], fish[3]);
        ellipse(x+fish[4], y, fish[6], fish[7]);
    }else{
        ellipse(x, y, -fish[2], -fish[3]);
        ellipse(x-fish[4], y, -fish[6], -fish[7]);
    }
}