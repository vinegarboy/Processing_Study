
int x = 30;                 // 円の中心の x座標の初期値
int[] y,ys;                // 円の中心の y座標
int dx = 30;                // 円の中心間の距離
int[] d;                    // 円の直径
int n = 12;                 // 円の個数
float[] h;               // 円の色相
int a = 0;
int ad = int(random(1,3));

void setup(){
    size(400, 400);
    frameRate(60);
    background(255, 255, 255);
    noStroke();
    d = new int[] { 30, 15, 40, 10, 25, 20, 10, 40, 5, 45, 10, 35 };
    h = new float[n];
    y = new int[n];
    ys = new int[n];
    background(255,255,255);
    for(int i = 0; i < h.length; i++) {
        h[i] = random(0, 360);
        y[i] = int(random(0, height));
        ys[i] = int(random(-10,10));
        if(ys[i]==0){
            ys[i]=1;
        }
    }
    colorMode(HSB, 360, 100, 100);
}

void draw(){
    x=30;
    a+=ad;
    if(a>100||a<0){
        ad=-ad;
    }
    background(0,0,100);
    for(int i = 0; i < n; i++) {
        fill(h[i], a,100);
        if(int(random(0,1))==0){
            ellipse(x, y[i]+d[i], d[i], d[i]);
        }else {
            ellipse(x, y[i]-d[i], d[i], d[i]);
        }
        y[i]+= ys[i];
        if(y[i]<0||y[i]>height){
            ys[i]=-ys[i];
        }
        x = x + dx;
    }
}
