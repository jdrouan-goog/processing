void setup() {
  size(0x200, 0x200);
}

void draw() {
  translate(width/2, height/2);
  rotate(-HALF_PI);
  translate(-width/2, -height/2);
  background(0xA0);
  drawSerpinski(0, 0, width, height, 8);
  noLoop();
}

void drawSerpinski(float x, float y, float w, float h, int d) {
  if (d == 0) {
    drawTriangle(x, y, w, h);
  } else {
    float new_w = w/2;
    float new_h = h/2;
    drawSerpinski(x, y, new_w, new_h, d - 1);
    drawSerpinski(x, y + new_h, new_w, new_h, d - 1);
    drawSerpinski(x + new_w, y, new_w, new_h, d - 1);
  }
}

void drawTriangle(float x, float y, float w, float h) {
  PShape sp0 = createShape();
  sp0.beginShape();
  sp0.vertex(x, y);
  sp0.vertex(x, y + h);
  sp0.vertex(x + w, y);
  sp0.fill(0);
  sp0.noStroke();
  sp0.endShape(CLOSE);
  shape(sp0);
}
