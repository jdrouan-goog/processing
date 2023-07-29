class CircleCanvas {
  float radius;
  float buffer;
  float pxSize;
  int numRows;
  ArrayList<PseudoPixel> circlePx;
  float cx;
  float cy;

  public CircleCanvas(PImage img, float r, float b, float ps) {
    radius = r;
    buffer = b;
    pxSize = ps;

    cx = radius + buffer;
    cy = radius + buffer;
    circlePx = new ArrayList<PseudoPixel>();

    numRows = int((radius * 2) / ps);
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numRows; j++) {
        float newPx = map(i, 0, numRows, 0, width - buffer*2) + buffer + ps/2;
        float newPy = map(j, 0, numRows, 0, height - buffer*2) + buffer + ps/2;
        float dist = dist(newPx, newPy, cx, cy);
        if (dist < radius) {
          float value = sampleImage(img, j, i, numRows);
          circlePx.add(new PseudoPixel(newPx, newPy, ps, value));
        }
      }
    }
  }
  
  float sampleImage(PImage img, float row, float col, int numRows) {
    float step = img.width / numRows;
    float x = col * step;
    float y = row * step;
    PImage newImg = img.get(int(x), int(y), int(step), int(step));
    return getAverageValue(newImg);
  }

  float getAverageValue(PImage img) {
    float sum = 0.0;
    for (int i = 0; i < img.width; i++) {
      for (int j = 0; j < img.height; j++) {
        color c = img.get(i, j);
        sum += brightness(c);
      }
    }
    float avg = sum / (img.width) * (img.height);
    return map(avg, 0, 255, 0, 1);
  }

  void preview() {
    for (PseudoPixel px : circlePx) {
      px.display();
    }
  }
}

class PseudoPixel {
  float x;
  float y;
  float s;
  float value;

  public PseudoPixel(float x_, float y_, float size, float v) {
    x = x_;
    y = y_;
    s = size;
    value = v;
  }

  void display() {
    rectMode(CENTER);
    //strokeWeight(0.5);
    noStroke();
    fill(map(value, 0, 1, 0, 255));
    rect(x, y, s, s);
  }
}
