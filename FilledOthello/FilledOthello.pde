size(500, 500);
int d=width/10;
int c=d*4/5;
for (int y = d; y <= height-d; y = y + d) {
    line(d, y, width-d, y);
    if(y==height-d){
        break;
    }
    for (int x = d; x <= width-d; x = x + d) {
        line(x, y, x, y+d);
        if(x==width-d){
            break;
        }
        fill(255, 255, 255);
        ellipse(x+d/2, y+d/2, c, c);
    }
}