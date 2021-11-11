final int fps = 60,hueMax = 360;
Circles cir = new Circles();

void setup(){
    frameRate(fps);
    size(480, 480);
    noStroke();
    colorMode(HSB, hueMax, 100, 100);
    fill(0, 0, 0);
}

void draw(){
    background(0, 0, 100);
    cir.make();
    cir.draw();
}

class Circles{
    float c_width,c_height,d,hue;
    void draw(){
        if(width-c_width>=0){
            fill(hue,100,100);
            ellipse(width/2,height/2,width-c_width,height-c_height);
            fill(360-hue,100,100);
            ellipse(width/2,height/2,c_width,c_height);
        }else{
            fill(360-hue,100,100);
            ellipse(width/2,height/2,c_width,c_height);
            fill(hue,100,100);
            ellipse(width/2,height/2,width-c_width,height-c_height);
        }
    }

    void make(){
        float rad = atan2(mouseX-(width/2),mouseY-(height/2));
        if(degrees(rad)>=0){
            hue = degrees(rad);
        }else{
            hue = -(degrees(rad)*2);
        }
        c_width = 2*dist(mouseX,mouseY,pmouseX,pmouseY);
        c_height = c_width;
    }
}