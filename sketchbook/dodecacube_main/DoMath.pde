class DoMath {
  float ANGLE_18 = HALF_PI * (0.2);
  float ANGLE_36 = PI * (0.2);
  float ANGLE_54 = (3 * HALF_PI) * (0.2);
  float ANGLE_72 = TWO_PI * (0.2);
  float ANGLE_108 = (3 * PI) * (0.2);
  float SIN_36 = sin(ANGLE_36);
  float COS_36 = cos(ANGLE_36);
  float TAN_18 = tan(ANGLE_18);
  float TAN_72 = tan(ANGLE_72);

  void doMath() {
    confirmAngles();
    computeRegularFiveTriangles();
    computeRegularTriPlusTrap();
    computeRegularPentGeneral();
    computeIsocolesPentagon();
  }

  private void computeRegularTriPlusTrap() {
    println("Regular pentagon adding triangle and trapezoid");
    //float R = 1.0;
    //float s = R * SIN_36 * (2.0);

    float s = 80.0;
    float R = s / (SIN_36 * (2.0));

    float r = R * COS_36;
    float d = s * COS_36 * (2.0);
    float H = R + r;
    float h1 = s * SIN_36;
    float h2 = H - h1;
    float area = areaPentagon(d, s, h1, h2);
    println(area);
  }

  private void computeRegularFiveTriangles() {
    println("Regular pentagon adding five triangles");
    //float R = 1.0;
    //float s = R * SIN_36 * (2.0);

    float s = 80.0;
    float R = s / (SIN_36 * (2.0));

    float r = R * COS_36;
    float area = areaTriangle(s, r) * (5.0);
    println(area);
  }

  private void computeRegularPentGeneral() {
    println("Regular pentagon adding triangle and trapezoid - generalized");
    //float R = 1.0;
    //float s = R * SIN_36 * (2.0);

    float s = 80.0;
    float R = s / (SIN_36 * (2.0));

    float d = s * COS_36 * (2.0);
    float w = (d - s) * (0.5);

    float h1 = s * SIN_36;

    float h2 = w * TAN_72;

    float area = areaPentagon(d, s, h1, h2);
    println(area);
  }

  private void computeIsocolesPentagon() {
    println("Isocoles pentagon");
    //float R = 1.0;
    //float s = R * SIN_36 * (2.0);

    float s = 80.0;
    float h = 100.0;
    
    float firstTriangle = areaTriangle(s, h);
    
    float d = ANGLE_108;
    
    float y = sqrt(pow((s/2), 2) + h*h);

    float f = atan(h/(s/2.0));
    float c = d - f;


    float secondTriangle = 0.0;
    float area = 2 * secondTriangle + firstTriangle;
    print(area);
  }

  private float areaTriangle(float b, float h) {
    return (b * h) * (0.5);
  }

  private float areaTrapezoid(float a, float b, float h) {
    return ((a + b) * h) * (0.5);
  }

  private float areaPentagon(float a, float b, float h1, float h2) {
    return areaTriangle(a, h1) + areaTrapezoid(a, b, h2);
  }

  private void confirmAngles() {
    println(ANGLE_18 + " radians equals " + degrees(ANGLE_18) + " degrees");
    println(ANGLE_36 + " radians equals " + degrees(ANGLE_36) + " degrees");
    println(ANGLE_54 + " radians equals " + degrees(ANGLE_54) + " degrees");
    println(ANGLE_72 + " radians equals " + degrees(ANGLE_72) + " degrees");
    println(ANGLE_108 + " radians equals " + degrees(ANGLE_108) + " degrees");
  }
}
