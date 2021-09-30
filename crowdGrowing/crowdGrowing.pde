final int faceDiameter = 30;
final int humanBodyWidth = 20;

void setup() {
    size(400, 400);
    background(255, 255, 255);
    noStroke();
    colorMode(HSB, 360, 100, 100);
}

void draw(){
    drawHuman(random(0,width),random(0,height),random(30,100),random(0,360));
}
void drawHuman(float x, float y, float bodyHeight,float h) {
    fill(h,100,100);
    ellipse(x, y - bodyHeight, faceDiameter, faceDiameter);
    rect(x - humanBodyWidth / 2, y - bodyHeight, humanBodyWidth, bodyHeight);
}