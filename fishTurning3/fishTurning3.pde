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

int[] x={100,100,100};
int[] y={100,200,300};
int vx;
int[][] fish = new int[3][8];

void setup() {
    size(400, 400);
    noStroke();
    background(63, 63, 255);
    fill(63, 31, 31);
    vx = 1;
    for(int i = 0;i<3;i++){
        fish[i] = fishToRight;
    }
}

void draw() {
    background(63, 63, 255);
    fill(63, 31, 31);
    for(int i = 0;i<3;i++){
        drawFish(x[i],y[i],fish[i]);
        if (mouseX > x[i]) {
            fish[i] = fishToRight;
            vx = 1;
        } else if (mouseX < x[i]) {
            fish[i] = fishToLeft;
            vx = -1;
        } else {
            vx = 0;
        }
        x[i] = x[i] + vx;
    }
}

void drawFish(int _x,int _y,int[] fishinfo){
    ellipse(_x + fishinfo[bodyX], _y + fishinfo[bodyY], fishinfo[bodyLength], fishinfo[bodyWidth]);
    ellipse(_x + fishinfo[ finX], _y + fishinfo[ finY], fishinfo[ finLength], fishinfo[ finWidth]);
}