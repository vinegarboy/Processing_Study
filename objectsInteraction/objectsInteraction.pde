Rects re;

void setup(){
    colorMode(HSB, 360, 100, 100);
    size(400, 400);
    re = new Rects();
}
void draw(){
    background(0,0,100);
    re.draw();
}

class Rects{
    float si = 50;
    float hg =si/2;
    float speed = random(3, 10);
    void draw(){
        fill(0,100,100);
        rect(width/2-si, hg, si, si);
        fill(180,100,100);
        rect(width/2+si, height-hg-si, si, si);
        hg+=speed;
        if(hg>height-si||hg<0){
            speed = -speed;
        }
    }
}