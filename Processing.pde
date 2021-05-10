void setup()
{
  print("HelloWorld");
  size(600, 600);
}

void draw(){
  colorMode(HSB,360,100,100);
  background(255, 0, 0);
  fill(0, 0, 255);
  textSize(24);
  text("HelloWorld",300,300);
  save("img.jpg");
}