final int allvertex = 20;//円一周あたりに使う頂点数
final float dis = 50;//半径

void setup()
{
    size(640, 480, P3D);
}

void draw()
{
    background(127, 127, 127);
    camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
    stroke(255, 0, 0);
    line(0, 0, 0, 100, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, 100, 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, 100);
    stroke(0,0,0);
    beginShape();
    for(int i =0;i<allvertex;i++){
        float rad = radians((360/allvertex)*i);
        vertex(dis*cos(rad),0,dis*sin(rad));
    }
    endShape(CLOSE);
}