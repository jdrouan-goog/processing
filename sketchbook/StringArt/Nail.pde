class Nail {
  float angle;
  float x;
  float y;
  
  public Nail(float a, float r) {
    angle = a;
    x = r * sin(a) + width/2;
    y = r * cos(a) + height/2;
  }
}
