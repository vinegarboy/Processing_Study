final int[][] fish = new int[][] {
    {0, 50, 70, 30,
    -38, 0, 15, 25,0},
    {0, 100, 70, 30,
    -38, 0, 15, 25,0},
    {0, 150, 70, 30,
    -38, 0, 15, 25,0},
    {0, 200, 70, 30,
    -38, 0, 15, 25,0},
    {0, 250, 70, 30,
    -38, 0, 15, 25,0},
    {0, 300, 70, 30,
    -38, 0, 15, 25,0}
};
final int bodyX = 0;
final int bodyY = 1;
final int bodyLength = 2;
final int bodyWidth =3;
final int finX = 4;
final int finY = 5;
final int finLength = 6;
final int finWidth = 7;
int y;
int v;

void setup() {
    size(400, 400);
    noStroke();
    background(63, 63, 255);
    fill(63, 31, 31);
    v = 1;
}

void draw() {
    background(63, 63, 255);
    fill(63, 31, 31);
    fill(255,255,255);
    for(int i = 0;i<6;i++){
        v = int(dist(mouseX,mouseY,fish[i][0],fish[i][1]))/int(random(40,70));
        fill(63, 31, 31,(i+5)*25);
        if(mouseX>fish[i][0]+fish[i][2]/2){
            fish[i][0]+=v;
            fish[i][8] = 0;
        }else if(mouseX<fish[i][0]-fish[i][2]/2){
            fish[i][0]-=v;
            fish[i][8] = 1;
        }
        if(fish[i][8] == 0){
            ellipse(fish[i][0], fish[i][1], fish[i][2], fish[i][3]);
            ellipse(fish[i][0]+fish[i][4], fish[i][1], fish[i][6], fish[i][7]);
        }else{
            ellipse(fish[i][0], fish[i][1], -fish[i][2], -fish[i][3]);
            ellipse(fish[i][0]-fish[i][4], fish[i][1], -fish[i][6], -fish[i][7]);
        }
    }
}
