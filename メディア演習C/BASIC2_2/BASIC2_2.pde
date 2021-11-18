final int allvertex = 360;//円一周あたりに使う頂点数
final float dis = 50;//半径
PShape up,down,side;

void setup()
{
    size(640, 480, P3D);
    up=createShape();
    down=createShape();
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
    up.beginShape();
    down.beginShape();
    for(int i =0;i<allvertex;i++){
        beginShape();
        float rad = radians((360/allvertex)*i);
        up.vertex(dis*cos(rad),50,dis*sin(rad));
        down.vertex(dis*cos(rad),-50,dis*sin(rad));
        vertex(dis*cos(rad),50,dis*sin(rad));
        vertex(dis*cos(rad),-50,dis*sin(rad));
        rad = radians((360/allvertex)*(i+1));
        vertex(dis*cos(rad),-50,dis*sin(rad));
        vertex(dis*cos(rad),50,dis*sin(rad));
        endShape(CLOSE);
    }
    up.endShape(CLOSE);
    down.endShape(CLOSE);
    shape(up);
    shape(down);
}