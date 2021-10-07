final int x0 = 50;                          // 人の中心の x座標の初期値
final int y = 300;                          // 人の足元の y座標
final int dx = 50;                          // 人の中心線間の距離
final int humanBodyWidth = 20;              // 体の幅
final int faceDiameter = 30;                // 顔の直径
final int[] humanBodyHeight = new int[] {   // 胴体の長さ; 人数は7名
    145, 186, 176, 168, 186, 156, 172
};
int[] _humanBodyHeight = new int[7];

void setup() {
    size(400, 400);             // ウィンドウのサイズ
    background(255, 255, 255);  // 背景色(白)
    noStroke();                 // 輪郭線を無効に
    _humanBodyHeight = searchMaximum(humanBodyHeight);
    fill(0, 0, 0);
    for(int i = 0;i<_humanBodyHeight.length;i++){
        rect(x0+(dx*i), y, humanBodyWidth, -_humanBodyHeight[i]);
        ellipse(x0+(dx*i)+(humanBodyWidth/2), y-_humanBodyHeight[i], faceDiameter,faceDiameter);
    }
}

int[] searchMaximum(int[] date){
    return sort(date);
}