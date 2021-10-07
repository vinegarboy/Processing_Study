final float circleRadius = 150;   // 円の半径
final float dTheta = 5;           // 回転角 [degree] の増分/1フレーム
final float pointDiameter = 8;    // 点の直径
final float dDelta = 360.0 / 32;
// 変数
float centerX;                    // ウィンドウの中心のx座標
float centerY;                    // ウィンドウの中心のy座標
float theta,delta;                      // 回転角 [degree]
float x,y,shiki;

void setup() {
    size(400, 400);
    noStroke();
    background(255, 255, 255);
    colorMode(HSB, 360, 100, 100);
    centerX = width / 2;
    centerY = height / 2;
    theta = 0;
    delta = 0;
}

void draw() {
    float radTheta = radians(theta);
    x = pointX(circleRadius,radTheta,delta);
    y = pointY(circleRadius,radTheta);
    shiki = pointHue(shiki);
    fill(shiki,100,100);
    ellipse(x + centerX, y + centerY, pointDiameter, pointDiameter);
    theta = theta + dTheta;
    delta +=dDelta;
}

float pointX(float r,float rad,float zure){
    return r * cos(rad-radians(zure));
}

float pointY(float r,float rad){
    return r*sin(rad);
}

float pointHue(float _color){
    float _c = _color+6;
    if(_c>360){
        _c-=360;
    }
    return _c;
}