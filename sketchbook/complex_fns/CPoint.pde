class CPoint {
  float a;
  float b;
  float r;
  float theta;

  CPoint(float re, float im) {
    a = re;
    b = im;
    r = sqrt(a*a + b*b);

    if (a > 0) {
      theta = atan(b/a);
    } else if (a < 0) {
      theta = atan(b/a) + PI;
    } else {
      theta = atan(b/Float.MIN_VALUE);
    }
  }

  @Override
  public String toString() {
    //return "r: " + r + "; theta: " + theta;
    return a + " + " + b + "i";
  }

  CPoint add(CPoint z) {
    return new CPoint(this.a + z.a, this.b + z.b);
  }

  CPoint mult(CPoint z) {
    float re = a*z.a - b*z.b;
    float im = a*z.b + b*z.a;
    
    return new CPoint(re, im);
  }
}
