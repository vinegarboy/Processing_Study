final int x0 = 50;                          // 人の中心の x座標の初期値
final int y = 300;                          // 人の足元の y座標
final int dx = 50;                          // 人の中心線間の距離
final int humanBodyWidth = 20;              // 体の幅
final int faceDiameter = 30;                // 顔の直径
final int[] humanBodyHeight = new int[] {   // 胴体の長さ; 人数は7名
    145, 186, 176, 168, 186, 156, 172
};
int[] _humanBodyHeight = humanBodyHeight;

void setup() {
    size(400, 400);             // ウィンドウのサイズ
    background(255, 255, 255);  // 背景色(白)
    noStroke();                 // 輪郭線を無効に
    _humanBodyHeight = searchMaximum(_humanBodyHeight);
    frameRate(1);
}

void draw(){
    background(255, 255, 255);
    fill(0, 0, 0);
    _humanBodyHeight = searchMaximum(_humanBodyHeight);
    for(int i = 0;i<_humanBodyHeight.length;i++){
        rect(x0+(dx*i), y, humanBodyWidth, -_humanBodyHeight[i]);
        ellipse(x0+(dx*i)+(humanBodyWidth/2), y-_humanBodyHeight[i], faceDiameter,faceDiameter);
    }
}

int[] searchMaximum(int[] date){
    int[] _return = new int[date.length];
    int sub1 = date[0];
    for(int i = 1;i<date.length-1;i++){
        if(sub1 > date[i]){
            _return[i-1] = date[i];
        }else{
            _return[i-1] = sub1;
            sub1 = date[i];            
        }
    }
    if(date[date.length-1]>=sub1){
        _return[_return.length-2] = sub1;
        _return[_return.length-1] = date[date.length-1];
    }else if(date[date.length-1]<sub1){
        _return[_return.length-2] = date[date.length-1];
        _return[_return.length-1] = sub1;
    }
    return _return;
}