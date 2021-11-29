void setup()
{
 size(640, 480, P3D);
}

void draw()
{
  background(127, 127, 127);
  camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
  axis(100);
  fill(255, 0, 0);
  noStroke();
  pointLight(255, 255, 255, 50, 0, 0);
  sphere(30);
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
