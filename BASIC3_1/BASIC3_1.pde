Spheres[] s = new Spheres[4];
final float distance = 60;

void setup()
{
    size(640, 480, P3D);
    for(int i =0;i<s.length;i++){
        s[i]=new Spheres();
        s[i].init(distance*cos(radians(i*(360/s.length))),0,distance*sin(radians(i*(360/s.length))),i*(360/s.length));
    }
}

void draw()
{
    background(127, 127, 127);
    camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
    axis(100);
    for(int i =0;i<s.length;i++){
        s[i].draw();
    }
}

void axis(float l)
{
    stroke(255, 0, 0);
    line(0, 0, 0, l, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, l, 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, l);
}

class Spheres{
    float x,y,z,degree;
    void init(float _x,float _y,float _z,float _degree){
        x = _x;
        y = _y;
        z = _z;
        degree = _degree;
    }

    void rotetion(){
        degree++;
        x=distance*cos(radians(degree));
        z =distance*sin(radians(degree));
    }

    void draw(){
        pushMatrix();
        translate(x, y, z);
        axis(30);
        stroke(0, 0, 0);
        rotetion();
        sphere(20);
        popMatrix();
    }
}