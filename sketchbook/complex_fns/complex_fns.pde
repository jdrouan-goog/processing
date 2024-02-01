CPlane plane;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 1, 1);

  plane = new CPlane();
}

void draw() {
  background(0);

  plane.showPlane();

  noLoop();
}
