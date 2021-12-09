import ddf.minim.*;

Minim  minim  =  new Minim();
int mode=0;
final int width_ = 600;
final int height_ = 400;
Fumen[] fumens;
int select_key=0,nf=0;

void setup() {
    size(600,400);
    colorMode(HSB, 360, 100, 100);
    frameRate(60);
    //selectFolder("譜面データのまとめたフォルダを選択してください","loadFile");
}

void draw() {
    background(0,0,0);
    switch (mode) {
        case 0 :
            title();
        break;
        case 1 :
            menu();
        break;
        case 2 :
            play();
        break;
    }
}

void title(){
    textSize(48);
    text("ClickCircle", 10, 50);
    textSize(32);
    text("Click!",width/2-64,height*2/3);
    if(mousePressed){
        mode = 1;
    }
}

void loadFile(File selection){
    File[] files = selection.listFiles();
    String[] str = new String[1];
    for(int i = 0; i < files.length; i++){
        if(files[i].getPath().endsWith(".fum")){
            append(str, files[i].getAbsolutePath());
        }
    }
    fumens = new Fumen[str.length];
    for(int i = 0;i<str.length;i++){
        fumens[i] = new Fumen(str[i]);
    }
}

void menu(){
    textSize(16);
    for(int i = 0;i<fumens.length;i++){
        fill(0,0,100);
        if(select_key==i){
            fill(180,100,100);
        }
        text(fumens[i].title+" by:"+fumens[i].comp,40,i*16);
    }
    if(keyPressed&&keyCode==ENTER){
        mode=2;
    }
}

void play(){
    if(nf>180){

    }
}

class Fumen{
    String title,comp,song_path;
    String[] notes_d;
    Fumen(String path){
        String date="";
        for(int i =0;i<loadStrings(path).length;i++){
            date+=loadStrings(path)[i];
        }
        String[] dates = split(date, ',');
        title = dates[0];
        comp = dates[1];
        song_path = dates[2];
        notes_d = new String[dates.length-3];
        for(int i =3;i<dates.length;i++){
            notes_d[i-3] = dates[i];
        }
    }
}

class Note{
    int frame = 60;
    final int d = 30;
    float x,y;
    int sf;
    Note(float _x,float _y,int _sf){
        x = _x;
        y = _y;
        sf = _sf;
    }

    void draw(){
        fill((360/60)*frame,100,100);
        ellipse(x, y, d, d);
        frame--;
    }
}