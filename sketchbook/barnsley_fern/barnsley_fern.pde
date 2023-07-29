////------------ barnsley fern ------------//
String demoName = "barnsley_fern";
float[][] F = {
  {  0.00,  0.00,  0.00, 0.16, 0.00, 0.00 },
  {  0.85,  0.04, -0.04, 0.85, 0.00, 1.60 },
  {  0.20, -0.26,  0.23, 0.22, 0.00, 1.60 },
  { -0.15,  0.28,  0.26, 0.24, 0.00, 0.44 }
};
float[] P = { 0.01, 0.85, 0.07 }; // P[3] is implied to be whatever makes it add up to 1.
float[] R = { -2.2, 2.7, 0, 10 }; // The range (minX, maxX, minY, maxY).

//------------ modified pinnae ------------//
//String demoName = "modified_pinnae";
//float[][] F = {
//  {  0.000, 0.000, 0.000, 0.200, 0.00, -0.12 },
//  {  0.845, 0.035, -0.035, 0.820, 0.00, 1.60 },
//  {  0.200, -0.310, 0.255, 0.245, 0.00, 0.29 },
//  { -0.150, 0.240, 0.250, 0.200, 0.00, 0.68 }
//};
//float[] P = { 0.01, 0.85, 0.07 };
//float[] R = { -2.35, 1.92, -0.11, 8.54 };

//------------ culcita_fern ------------//
//String demoName = "culcita_fern";
//float[][] F = {
//  { 0, 0, 0, 0.25, 0, -0.14 },
//  { 0.85, 0.02, -0.02, 0.83, 0, 1 },
//  { 0.09, -0.28, 0.3, 0.11, 0, 0.6 },
//  { -0.09, 0.28, 0.3, 0.09, 0, 0.7 }
//};
//float[] P = { 0.02, 0.84, 0.07 };
//float[] R = { -1.55, 1.55, -0.17, 5.79 };

//------------ pellaea_fern ------------//
//String demoName = "pellaea_fern";
//float[][] F = {
//  { 0, 0, 0, 0.25, 0, -0.4 },
//  { 0.95, 0.002, -0.002, 0.93, -0.002, 0.5 },
//  { 0.035, -0.11, 0.27, 0.01, -0.05, 0.005 },
//  { -0.04, 0.11, 0.27, 0.01, 0.047, 0.06 }
//};

//float[] P = { 0.02, 0.84, 0.07 };
//float[] R = { -0.8, 0.8, -0.50, 7 };


//------------ cyclosorus_fern ------------//
//String demoName = "cyclosorus_fern";
//float[][] F = {
//  { 0, 0, 0, 0.25, 0, -0.4 },
//  { 0.95, 0.005, -0.005, 0.93, -0.002, 0.5 },
//  { 0.035, -0.2, 0.16, 0.04, -0.09, 0.02 },
//  { -0.04, 0.2, 0.16, 0.04, 0.083, 0.12 }
//};

//float[] P = { 0.02, 0.84, 0.07 };
//float[] R = { -1.45, 1.45, -0.50, 7 };

int speed = 100; // Number of iterations per frame
int iterations = 250000;
int iterCount = 0;

PVector p = new PVector(0, 0);

void setup() {
  size(700, 980);
  background(color(0x02, 0x30, 0x20));
  stroke(color(255, 204, 0));
  strokeWeight(1);
}

void draw() {
  for (int i = 0; i < speed; i++) {
    drawPoint();
    updatePoint();
  }

  if (frameCount % 100 == 0) {
    String formatted = String.format("%06d", iterCount);
    String fileName = demoName + "_" + formatted + "_iters.png";
    save(fileName);
    println("Wrote file: " + fileName);
  }

  if (iterCount >= iterations) {
    noLoop();
  }
}

void drawPoint() {
  int b = 50;
  float x = map(p.x, R[0], R[1], b, width - b);
  float y = map(p.y, R[2], R[3], height - b, b);
  point(x, y);
}

void updatePoint() {
  iterCount++;

  float r = random(1);
  int i;
  if (r < P[0]) {
    i = 0;
  } else if (r < P[0] + P[1]) {
    i = 1;
  } else if (r < P[0] + P[1] + P[2]) {
    i = 2;
  } else {
    i = 3;
  }

  float nextX = F[i][0] * p.x + F[i][1] * p.y + F[i][4];
  float nextY = F[i][2] * p.x + F[i][3] * p.y + F[i][5];
  p.x = nextX;
  p.y = nextY;
}
