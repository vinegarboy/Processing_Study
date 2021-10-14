final int humanX0 = 50;
final int dhumanX = 50;
final int humanY0 = 300;
final int humanBodyWidth = 20;
final int faceDiameter = 30;
final int n = 7;

void setup() {
    size(400, 400);
    background(255, 255, 255);
    noStroke();
    colorMode(HSB, 360, 100, 100);
    int humanX = humanX0;
    for(int i = 0; i < n; i++) {
        int humanBodyHeight = (int)random(120, 160);
        drawHuman(humanX, humanY0, humanBodyHeight,(360/n)*i, 100, 100);
        humanX = humanX + dhumanX;
    }
}

void drawHuman(int x, int y, int bodyHeight,float h,int s ,int b) {
    fill(h,s,b);
    ellipse(x, y - bodyHeight, faceDiameter, faceDiameter);
    rect(x - humanBodyWidth / 2, y - bodyHeight, humanBodyWidth, bodyHeight);
}