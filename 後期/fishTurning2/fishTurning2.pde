final int[] fishToLeft  = new int[] {
    0, 0, 70, 30,
    38, 0, 15, 25
};
final int[] fishToRight = new int[] {
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
int[] fish;

void setup() {
    size(400, 400);
    noStroke();
    background(63, 63, 255);
    fill(63, 31, 31);
    x = 100;
    y = 200;
    vx = 1;
    fish = fishToRight;
}

void draw() {
    background(63, 63, 255);
    fill(63, 31, 31);
    drawFish(x,fish);
    if (mouseX > x) {
        fish = fishToRight;
        vx = 1;
    } else if (mouseX < x) {
        fish = fishToLeft;
        vx = -1;
    } else {
        vx = 0;
    }
    x = x + vx;
}

void drawFish(int fishcenter,int[] fishinfo){
    ellipse(x + fishinfo[bodyX], y + fishinfo[bodyY], fishinfo[bodyLength], fishinfo[bodyWidth]);
    ellipse(x + fishinfo[ finX], y + fishinfo[ finY], fishinfo[ finLength], fishinfo[ finWidth]);
}