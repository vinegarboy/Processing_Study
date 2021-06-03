int x=1024;
int y=512;
void settings(){
    size(x, y);
}

void setup() {
    background(90, 57, 40);
    int kenban = 14;
    int _x;
    int ma = 40;
    strokeWeight(4);
    fill(255,255,255);
    rect(ma, ma, width-(ma*2), height-(ma*2));
    fill(0,0,0);
    for(int i =1;i<kenban;i++){
        _x=(((width-(ma*2))/kenban)*i)+ma;
        line(_x,ma,_x,height-ma);
        if(i%7==0||i==1){
            for(int d = 1;d<7;d++){
                if(d!=3){
                    int kox = (((width-(ma*2))/kenban)*2)/3;
                    int hma = ma+(i*((width-(ma*2))/kenban))+(((width-(ma*2))/kenban)*(d-1));
                    if(i==1){
                        hma=ma+(((width-(ma*2))/kenban)*(d-1));
                    }
                    rect(hma+kox, ma, (((width-(ma*2))/kenban)/3)*2, ((height-(ma*2))/3)*2);
                }
            }
        }
    }
}

void draw(){

}