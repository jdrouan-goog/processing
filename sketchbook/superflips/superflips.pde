Face face;

void setup() {
  size(500, 500);
  face = new Face(7);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  face.drawFace();
  noLoop();
}

void mouseClicked() {
  loop();
  face.handleMouse(mouseX, mouseY);
  loop();
}
