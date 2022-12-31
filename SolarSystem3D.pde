import peasy.*;

Planet sun;
PeasyCam cam;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0);
  sun.spanMoons(2, 1);
  
}

void draw() {
  background(0);
  ambientLight(51, 102, 126);
  directionalLight(51, 102, 126, -1, 0, 0);
  //lights();
  sun.show();
  sun.orbit();
}
