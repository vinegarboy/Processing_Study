int _x=500,_y=500;
int x = 30;
int y = 30;
int dx = 30;
int d = 3;
int dd = 2;
int n = 12;   
int yn = 12;
int dy = 30;

void settings(){
    size(_x, _y);
}

void setup() {
}

void draw(){
    noStroke();
    background(255, 255, 255);
    x=30;
    d=3;
    y=30;
    for(int h = 0;h<n;h++){
        for(int i = 0; i < n; i++) {
            fill(255, 0, 0);
            if(h==i){
                fill(0,0,255);
            }
            ellipse(x, y, d, d);
            x = x + dx;
            d = d + dd;
        }
        y+=dy;
        x=30;
        d = 3;
    }
}