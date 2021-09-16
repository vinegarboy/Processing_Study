int fps = 24;        // フレーム数/秒(1フレームごとにサイコロを振る前提)
int dY = 60;
int w = 40;
int diceSides = 6;   // サイコロの面の数
int marginTop = 30;  // 上の余白
int marginLeft = 50; // 左の余白 (文字を除く)
int marginChar = 15; // 文字の左余白
int[] freq;   // サイコロの目ごとの回数を格納
int dis = 20;
boolean end = false;

void setup () {
    size(640, 400);
    frameRate(fps);
    noStroke();
    background(255, 255, 255);
    colorMode(HSB, 360, 100, 100);
    freq = new int[diceSides];
}
void draw() {
    int diceValue = (int)random(0, diceSides);
    freq[diceValue]++;
    for(int i = 0; i < freq.length; i++) {
        end = false;
        int y = marginTop + i * dY;
        fill(0, 0, 0);
        textSize(16);
        text(i + 1, marginChar, y + w / 2);
        if(marginLeft + freq[i]*dis > width) {
            end=true;
            noLoop();
        }
        fill(360 * i / diceSides, 100, 100);
        for(int rp = 0;rp<freq[i];rp++){
            if(end&&rp+1==freq[i]){
                fill(0,0,0);
            }
            ellipse(marginLeft+rp*dis, y+15, dis,dis);
        }
    }
}