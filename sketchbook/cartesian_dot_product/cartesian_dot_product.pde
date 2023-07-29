float angleNormalizedValues[];
float dotNormalizedValues[];
int res = 360;
int MAX = 0xFF;
int maxDiff;

void setup() {
  colorMode(HSB, MAX);
  size(1024, 512);
  angleNormalizedValues = new float[res];
  dotNormalizedValues = new float[res];

  for (int i = 0; i < res; i++) {
    float alpha = (i * TWO_PI)/res;
    angleNormalizedValues[i] = map(alpha, 0, TWO_PI, 0, MAX);
    dotNormalizedValues[i] = getDotProductColor(alpha);
  }
  
  maxDiff = findMaxDiff();
}

void draw() {
  background(0);

  strokeWeight(24);
  for (int i = 0; i < res; i++) {
    float xValue = map(i, 0, res, 0, width);
    float diff = dotNormalizedValues[i] - angleNormalizedValues[i];
    println(diff);
    float yValue = map(diff, -maxDiff, maxDiff, height, 0);
    stroke(angleNormalizedValues[i], MAX, MAX);
    point(xValue, yValue);
    stroke(dotNormalizedValues[i], MAX, MAX);
  }

  noLoop();
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

int findMaxDiff() {
  return 14;
}
