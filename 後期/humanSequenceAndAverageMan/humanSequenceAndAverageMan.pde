size(440, 400);             // ウィンドウのサイズ
background(255, 255, 255);  // 背景色(白)
noStroke();                 // 輪郭線を無効に

int x = 50;                 // 人の中心の x座標の初期値
int y = 300;                // 人の足元の y座標
int dx = 50;                // 人の中心線間の距離
int[] h;                    // 身長
int w = 20;                 // 体の幅
int d = 30;                 // 顔の直径

h = new int[] { 145, 186, 176, 168, 186, 156, 172 };  // 身長; 人数は7名
int ah =0;
fill(0,0,0);
for(int i = 0;i<7;i++){
    rect(x, y, w, -h[i]);
    ellipse(x+(w/2), y-h[i], d,d);
    x+=dx;
    ah+=h[i];
}
fill(255,255,0);
rect(x, y, w, -ah/7);
ellipse(x+(w/2), y-ah/7, d,d);