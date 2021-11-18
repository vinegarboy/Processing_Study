final int allvertex = 360;//円一周あたりに使う頂点数
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
    for(int i =0;i<allvertex;i++){
        float rad = radians((360/allvertex)*i);
        float nrad = radians((360/allvertex)*(i+1));
        beginShape();
        for(int d = -90;d<90;d++){
            float rad2 = radians(d);
            vertex(dis*cos(rad)*cos(rad2),dis*sin(rad2),dis*sin(rad)*cos(rad2));
            vertex(dis*cos(nrad)*cos(rad2),dis*sin(rad2),dis*sin(nrad)*cos(rad2));
        }
        endShape(CLOSE);
    }
}