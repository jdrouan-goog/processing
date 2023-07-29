int N = 20;
Nail[] nails;
ArrayList<Integer> nailsToDraw;
CircleCanvas canvas;
PImage inputImg;

void setup() {
  size(440, 440);
  inputImg = loadImage("data/arch.tif");

  float buffer = 50;
  float radius = width/2 - buffer;

  //setUpNails(N, radius);

  canvas = new CircleCanvas(inputImg, radius, buffer, (radius / 100));

  background(255);
}

void draw() {
  if (nailsToDraw != null) {
    drawTheString();
  } else {
    canvas.preview();
    noLoop();
  }
  //image(inputImg, 0, 0);
  noLoop();
  //loadPixels();

  //for (int i = 0; i < pixels.length; i++) {
  //  color c = color(pixels[i]);
  //  float value = brightness(c);
  //  if (value > 50) {
  //    pixels[i] = color(255);
  //  }
  //}
  //updatePixels();
}

void setUpNails(int n, float r) {
  setUpBaseNails(n, r);

  nailsToDraw = new ArrayList<>();
  nailsToDraw.add(0);
  for (int i = 0; i < 100; i++) {
    nailsToDraw.add(int(random(nails.length)));
  }
  nailsToDraw.add(0);
}

void setUpBaseNails(int n, float r) {
  nails = new Nail[n];
  for (int i = 0; i < nails.length; i++) {
    nails[i] = new Nail(map(i, 0, n, 0, TWO_PI), r);
  }
}

void drawTheString() {
  if (frameCount > 0 && frameCount < nailsToDraw.size()) {
    stroke(0);
    strokeWeight(0.5);
    int startIndex = nailsToDraw.get(frameCount - 1);
    int endIndex = nailsToDraw.get(frameCount);
    Nail startNail = nails[startIndex];
    Nail endNail = nails[endIndex];

    line(startNail.x, startNail.y, endNail.x, endNail.y);
  } else {
    println("done");
    noLoop();
  }
}
