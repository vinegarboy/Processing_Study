size(500, 500);
int d=width/10;
int c=d*4/5;
for (int y = d; y <= height; y = y + d) {
    line(d, y, width, y);
    for (int x = d; x <= width; x = x + d) {
        line(x, y, x, height);
        fill(255, 255, 255);
        ellipse(x+d/2, y+d/2, c, c);
    }
}