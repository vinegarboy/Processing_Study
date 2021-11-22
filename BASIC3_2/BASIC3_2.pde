float x ,y=0,z,ed=0,ld=30;
final float distance = 60,md=30;

void setup()
{
    size(640, 480, P3D);
    x=distance;
    z=distance;
}

void draw()
{
    background(127, 127, 127);
    camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
    axis(100);
    ed++;
    ld++;
    pushMatrix();
    rotateY(radians(ed));
    translate(x, y, z);
    rotateY(radians(ed));
    sphereandaxis(20);
    rotateY(radians(ld));
    translate(md, 0, 0);
    rotateY(radians(ld));
    sphereandaxis(5);
    popMatrix();
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

void sphereandaxis(float si){
    axis(30);
    stroke(0, 0, 0);
    sphere(si);
}