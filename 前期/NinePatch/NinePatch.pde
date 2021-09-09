int x =600,y=600,tm = 5,ym=5;

void settings(){
    size(x,y);
}

void setup(){
    background(255,255,255);
    for(int i =1;i<=tm;i++){
        for(int d = 1;d<=ym;d++){
            if((i%2==0&&d%2==0)||(i%2!=0&&d%2!=0)){
                int x_dis = (x/ym)/3,y_dis = (y/tm)/3;
                for(int g =0;g<3;g++){
                    for(int h = 0;h<3;h++){
                        if((g%2==0&&h%2==0)||(g%2!=0&&h%2!=0)){
                            fill(random(0, 255),random(0, 255),random(0, 255));
                            rect((g*x_dis)+((d-1)*(x_dis*3)), (h*y_dis)+((i-1)*(y_dis*3)), x_dis, y_dis);
                        }
                    }
                }
            }
        }
    }
}

void draw(){
}