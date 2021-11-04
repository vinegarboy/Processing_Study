void setup(){
    size(480, 480);
    noStroke();
    colorMode( HSB, 360 , 100 , 100 );
    background(0,0,100);
    RecallEllipse(width,width/2);
}

void RecallEllipse(float elw,float center_x){
    fill(callHue(elw), 100, 100);
    ellipse(center_x,height/2,elw,elw);
    if(center_x+elw>=width){
        RecallEllipse(elw/2,elw/4);
    }else if(elw<=1){
        print("comp");
    }else{
        RecallEllipse(elw,center_x+elw);
    }
}

float callHue(float wide){
    float re = wide/2;
    if(re > 360){
        re-=360;
    }
    return re;
}