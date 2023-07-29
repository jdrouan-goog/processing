float angleNormalizedValues[];
float dotNormalizedValues[];
int res = 360;
int MAX = 0xFF;

void setup() {
  colorMode(HSB, MAX);
  size(512, 512);
  angleNormalizedValues = new float[res];
  dotNormalizedValues = new float[res];

  for (int i = 0; i < res; i++) {
    float alpha = (i * TWO_PI)/res;
    angleNormalizedValues[i] = map(alpha, 0, TWO_PI, 0, MAX);
    dotNormalizedValues[i] = getDotProductColor(alpha);
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);

  rotate(-HALF_PI);
  strokeWeight(24);
  float radius = width / 2;
  float outerRad = radius * 0.8;
  float innerRad = radius * 0.75;
  for (int i = 0; i < res; i++) {
    float alpha = i * (TWO_PI/res);
    PVector p = getCartCoords(outerRad, alpha);
    stroke(angleNormalizedValues[i], MAX, MAX);
    point(p.x, p.y);
    p = getCartCoords(innerRad, alpha);
    stroke(dotNormalizedValues[i], MAX, MAX);
    point(p.x, p.y);
  }
  rotate(HALF_PI);

  stroke(0, 0, MAX);
  strokeWeight(4);

  int mx = mouseX - (width/2);
  int my = mouseY - (height/2);
  
  
  
  line(0, 0, mx, my);
}

PVector getCartCoords(float r, float a) {
  float x = r * cos(a);
  float y = r * sin(a);
  return new PVector(x, y);
}

float getDotProductColor(float a) {
  PVector basisVector = new PVector(1, 0);
  PVector myVector = getCartCoords(1, a);
  float d = basisVector.dot(myVector);
  float m = 0;
  if (a < HALF_PI) {
    m = map(d, 1, 0, 0, HALF_PI);
  } else if (a < PI) {
    m  = map(d, 0, -1, HALF_PI, PI);
  } else if (a < (3 * HALF_PI)) {
    m  = map(d, -1, 0, PI, (3 * HALF_PI));
  } else {
    m  = map(d, 0, 1, (3 * HALF_PI), TWO_PI);
  }
  return map(m, 0, TWO_PI, 0, 0xFF);
}
