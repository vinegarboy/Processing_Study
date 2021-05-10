void setup()
{
  print("HelloWorld");
  size(1920, 1080);
}

void draw(){
  colorMode(HSB,360,100,100);
  background(255, 0, 0);
  fill(0, 0, 255);
  textSize(24);
  text("1920*1080*3="+(1920*1080*3),0,300);
  save("img.jpeg");
  save("img.bmp")
}