final int humanX0 = 50;
final int dhumanX = 50;
final int humanY0 = 300;
final int humanBodyWidth = 20;
final int faceDiameter = 30;

int[] humanBodyHeightArray = new int[] {120, 110, 150, 160, 140, 150, 120};
float[] humanHueArray = new float[] {0, 180, 90, 45, 225, 135, 315};

void setup() {
    size(400, 400);
    background(255, 255, 255);
    noStroke();
    colorMode(HSB, 360, 100, 100);
    drawHumanSequence(humanX0,humanY0,dhumanX,humanBodyHeightArray,humanHueArray);

}

void drawHumanSequence(int x,int y,int dx,int[] bodyHeightArray,float[] hueArray) {
    for(int i =0;i<bodyHeightArray.length;i++){
        drawHuman(x+(dx*i),y,bodyHeightArray[i],hueArray[i]);
    }
}

void drawHuman(int x, int y, int bodyHeight,float h) {
    fill(h,100,100);
    ellipse(x, y - bodyHeight, faceDiameter, faceDiameter);
    rect(x - humanBodyWidth / 2, y - bodyHeight, humanBodyWidth, bodyHeight);
}