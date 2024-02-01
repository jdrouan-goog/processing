class CPlane {
  float rmax;
  float rmin;
  float imax;
  float imin;

  float midRadius;
  float maxRadius = 0.0;

  CPoint[] values = new CPoint[height*width];

  // Constructor
  CPlane(float rn, float rx, float in, float ix) {
    rmax = rx;
    rmin = rn;
    imax = ix;
    imin = in;
    midRadius = sqrt(rx*rx + ix*ix);

    for (int row = 0; row < height; row++) {
      for (int col = 0; col < width; col++) {
        CPoint output = complexFn(new CPoint(map(col, 0, width, rmin, rmax), map(row, height, 0, imin, imax)));
        values[row * width + col] = output;
        maxRadius = max(maxRadius, output.r);
      }
    }
    println(midRadius);
    println(maxRadius);
  }

  // Default constructor.
  CPlane() {
    this(-1000, 1000, -1000, 1000);
  }

  // Do the actual complex function here.
  CPoint complexFn(CPoint input) {
    CPoint output = input.mult(input);
    //CPoint output = input;
    return output;
  }

  color getColorValue(CPoint value) {
    // The angle of the polar coordinate determines the hue.
    float hue = map(value.theta, -HALF_PI, 3*HALF_PI, 0, 360);

    // The magnitude of the radius determines the brightness,
    // We compute HSL first for better whites, then convert to HSB.
    // See: https://en.wikipedia.org/wiki/HSL_and_HSV#Interconversion
    float mag = value.r / maxRadius;
    mag = lerp(mag, 1, mag); // Weight the light colors more.
    float bri = mag + min(mag, 1 - mag);
    float sat = Math.signum(bri) == 0 ? 0 : 2*(1-(mag/bri));

    return color(hue, sat, bri);
  }

  // Draw the values.
  void showPlane() {
    strokeWeight(1);
    for (int row = 0; row < height; row++) {
      for (int col = 0; col < width; col++) {
        CPoint output = values[row * width + col];
        stroke(getColorValue(output));
        point(col, row);
      }
    }
  }
}
