final int dhumanX = 100;
final int humanY = 300;
final int humanBodyWidth = 30;
final int faceDiameter = 50;
int humanX = 150;

void setup() {
    size(400, 400);
    background(255, 255, 255);
    noStroke();
    colorMode(HSB, 360, 100, 100);

    Human man = new Human();
    Human woman = new Human();

    man.bodyHeight = (int)random(150, 190);
    man.bodyColor = (int)random(120, 240);
    drawHuman(humanX, humanY, man.bodyHeight, man.bodyColor);

    humanX += dhumanX;

    woman.bodyHeight = (int)random(130, 170);
    woman.bodyColor = (int)random(0, 60);
    drawHuman(humanX, humanY, woman.bodyHeight, woman.bodyColor);
}

class Human {
    int bodyHeight;
    int bodyColor;
}

void drawHuman(int x, int y, int bodyHeight, int bodyColor) {
    fill(bodyColor, 100, 100);
    ellipse(x, y - bodyHeight, faceDiameter, faceDiameter);
    rect(x - humanBodyWidth / 2, y - bodyHeight, humanBodyWidth, bodyHeight);
}