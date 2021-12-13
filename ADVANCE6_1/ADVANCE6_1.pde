PShader shader;

void setup(){
    size(640, 480, P3D);
    shader = loadShader("FragmentShader.glsl", "VertexShader.glsl");
}

void draw(){
    background(78,69,74);
    camera(100, -100, 100, 0, 0, 0, 0, 1, 0);
    axis(100);
    fill(255, 0, 0);
    noStroke();
    directionalLight(255, 255, 255, -1, 1, 0);
    shader(shader);
    pushMatrix();
    translate(0, -30, 0);
    sphere(30);
    popMatrix();
    fill(204,204,204);
    box(150,0.1,150);
}

void axis(float l){
    stroke(255, 0, 0);
    line(0, 0, 0, l, 0, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, l, 0);
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, l);
}