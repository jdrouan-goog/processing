int N = 12;
Nail[] nails;
ArrayList<Integer> nailsToDraw;
CircleCanvas targetImage;
PImage inputImg;
PGraphics pg0;
CircleCanvas s0can;

void setup() {
  size(800, 800);

  //targetImage = loadTargetImage("data/mookie.png");

  float buffer = 0;
  float radius = width/2 - buffer;
  //setUpNails(N, radius);
  setUpBaseNails(N, radius);

  //int targetImageSize = targetImage.circlePx.size();

  pg0 = createGraphics(width, height);




  stroke(0);
  //strokeWeight(4);
  //for (int i = 0; i < nails.length; i++) {
  //  Nail ni = nails[i];
  //  point(ni.x, ni.y);
  //}

  Nail n0 = nails[4];
  Nail n1 = nails[6];
  pg0.beginDraw();
  pg0.strokeWeight(100);
  pg0.line(n0.x, n0.y, n1.x, n1.y);
  println(n0.x + ";" + n0.y + ";" + n1.x + ";" + n1.y);
  pg0.endDraw();

  s0can = new CircleCanvas(pg0, radius, buffer, (radius / 8));




  //println(targetImageSize);

  background(255);
}

void draw() {
  //if (nailsToDraw != null) {
  //  drawTheString();
  //} else {
  //  targetImage.preview();
  //  noLoop();
  //}

  image(pg0, 0, 0);
  //s0can.preview();
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
  //save("data/test_img_with_blur.tif");
  //for (PseudoPixel px : targetImage.circlePx) {
  //  println(px.value);
  //}
}

CircleCanvas loadTargetImage(String filename) {
  inputImg = loadImage(filename);
  inputImg.filter(GRAY);
  inputImg.filter(BLUR);

  float buffer = 0;
  float radius = width/2 - buffer;

  return new CircleCanvas(inputImg, radius, buffer, (radius / 8));
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
