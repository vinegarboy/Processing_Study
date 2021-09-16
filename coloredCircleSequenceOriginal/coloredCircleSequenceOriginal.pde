
int x = 30;                 // 円の中心の x座標の初期値
int y = 200;                // 円の中心の y座標
int dx = 30;                // 円の中心間の距離
int[] d;                    // 円の直径
int n = 12;                 // 円の個数
float[] h;               // 円の色相
int a = 0;
int b = 0;

void setup(){
    size(400, 400);
    background(255, 255, 255);
    noStroke();
    d = new int[] { 30, 15, 40, 10, 25, 20, 10, 40, 5, 45, 10, 35 };
    h = new float[n];
    background(255,255,255);
    for(int i = 0; i < h.length; i++) {
        h[i] = random(0, 360);
    }
    colorMode(HSB, 360, 100, 100);
}

void draw(){
    for(int i = 0; i < n; i++) {
        fill(h[i], int(random(0,100)),int(random(0,100)));
        if(int(random(0,1))==0){
            ellipse(x, y+d[i], d[i], d[i]);
        }else {
            ellipse(x, y-d[i], d[i], d[i]);
        }
        x = x + dx;
    }
}
