class Dodecacube {
  ColorPicker cp;
  ArrayList<PVector> points;
  int rotClicks;
  String colorName;

  Dodecacube() {
    cp = new ColorPicker();
    points = new ArrayList<>();
    populatePointsArray(points);
    rotClicks = 0;
    colorName = "white";
  }

  private void populatePointsArray(ArrayList<PVector> arr) {
    for (int i = 0; i < 5; i++) {
      float angle = (i * TWO_PI)/5;
      arr.add(carts(90, angle));
      arr.add(carts(130, angle));
      arr.add(carts(200, angle));
      angle += TWO_PI/10;
      arr.add(carts(180, angle));
      arr.add(carts(220, angle));
    }
  }

  private PVector carts(float radius, float angle) {
    float x = radius * sin(angle);
    float y = -(radius * cos(angle));
    return new PVector(x, y);
  }

  void drawCube() {
    int rot = rotClicks % 5;
    rotate((TWO_PI * rot)/5);

    color[] colors = cp.getColors(colorName);
    PVector p;

    PShape f0 = createShape();
    f0.beginShape();
    for (int i = 0; i < 5; i++) {
      p = points.get(i*5);
      f0.vertex(p.x, p.y);
    }
    f0.fill(colors[0]);
    f0.noStroke();
    f0.endShape(CLOSE);

    PShape n0 = createShape();
    n0.beginShape();
    p = points.get(0);
    n0.vertex(p.x, p.y);
    p = points.get(1);
    n0.vertex(p.x, p.y);
    p = points.get(3);
    n0.vertex(p.x, p.y);
    p = points.get(6);
    n0.vertex(p.x, p.y);
    p = points.get(5);
    n0.vertex(p.x, p.y);
    n0.fill(colors[1]);
    n0.noStroke();
    n0.endShape(CLOSE);

    PShape n1 = createShape();
    n1.beginShape();
    p = points.get(3);
    n1.vertex(p.x, p.y);
    p = points.get(4);
    n1.vertex(p.x, p.y);
    p = points.get(9);
    n1.vertex(p.x, p.y);
    p = points.get(8);
    n1.vertex(p.x, p.y);
    p = points.get(6);
    n1.vertex(p.x, p.y);
    n1.fill(colors[2]);
    n1.noStroke();
    n1.endShape(CLOSE);

    PShape n2 = createShape();
    n2.beginShape();
    p = points.get(5);
    n2.vertex(p.x, p.y);
    p = points.get(6);
    n2.vertex(p.x, p.y);
    p = points.get(8);
    n2.vertex(p.x, p.y);
    p = points.get(11);
    n2.vertex(p.x, p.y);
    p = points.get(10);
    n2.vertex(p.x, p.y);
    n2.fill(colors[3]);
    n2.noStroke();
    n2.endShape(CLOSE);

    PShape n3 = createShape();
    n3.beginShape();
    p = points.get(8);
    n3.vertex(p.x, p.y);
    p = points.get(9);
    n3.vertex(p.x, p.y);
    p = points.get(14);
    n3.vertex(p.x, p.y);
    p = points.get(13);
    n3.vertex(p.x, p.y);
    p = points.get(11);
    n3.vertex(p.x, p.y);
    n3.fill(colors[4]);
    n3.noStroke();
    n3.endShape(CLOSE);

    PShape n4 = createShape();
    n4.beginShape();
    p = points.get(10);
    n4.vertex(p.x, p.y);
    p = points.get(11);
    n4.vertex(p.x, p.y);
    p = points.get(13);
    n4.vertex(p.x, p.y);
    p = points.get(16);
    n4.vertex(p.x, p.y);
    p = points.get(15);
    n4.vertex(p.x, p.y);
    n4.fill(colors[5]);
    n4.noStroke();
    n4.endShape(CLOSE);

    PShape n5 = createShape();
    n5.beginShape();
    p = points.get(13);
    n5.vertex(p.x, p.y);
    p = points.get(14);
    n5.vertex(p.x, p.y);
    p = points.get(19);
    n5.vertex(p.x, p.y);
    p = points.get(18);
    n5.vertex(p.x, p.y);
    p = points.get(16);
    n5.vertex(p.x, p.y);
    n5.fill(colors[6]);
    n5.noStroke();
    n5.endShape(CLOSE);

    PShape n6 = createShape();
    n6.beginShape();
    p = points.get(15);
    n6.vertex(p.x, p.y);
    p = points.get(16);
    n6.vertex(p.x, p.y);
    p = points.get(18);
    n6.vertex(p.x, p.y);
    p = points.get(21);
    n6.vertex(p.x, p.y);
    p = points.get(20);
    n6.vertex(p.x, p.y);
    n6.fill(colors[7]);
    n6.noStroke();
    n6.endShape(CLOSE);

    PShape n7 = createShape();
    n7.beginShape();
    p = points.get(18);
    n7.vertex(p.x, p.y);
    p = points.get(19);
    n7.vertex(p.x, p.y);
    p = points.get(24);
    n7.vertex(p.x, p.y);
    p = points.get(23);
    n7.vertex(p.x, p.y);
    p = points.get(21);
    n7.vertex(p.x, p.y);
    n7.fill(colors[8]);
    n7.noStroke();
    n7.endShape(CLOSE);

    PShape n8 = createShape();
    n8.beginShape();
    p = points.get(20);
    n8.vertex(p.x, p.y);
    p = points.get(21);
    n8.vertex(p.x, p.y);
    p = points.get(23);
    n8.vertex(p.x, p.y);
    p = points.get(1);
    n8.vertex(p.x, p.y);
    p = points.get(0);
    n8.vertex(p.x, p.y);
    n8.fill(colors[9]);
    n8.noStroke();
    n8.endShape(CLOSE);

    PShape n9 = createShape();
    n9.beginShape();
    p = points.get(23);
    n9.vertex(p.x, p.y);
    p = points.get(24);
    n9.vertex(p.x, p.y);
    p = points.get(4);
    n9.vertex(p.x, p.y);
    p = points.get(3);
    n9.vertex(p.x, p.y);
    p = points.get(1);
    n9.vertex(p.x, p.y);
    n9.fill(colors[10]);
    n9.noStroke();
    n9.endShape(CLOSE);

    PShape o0 = createShape();
    o0.beginShape();
    p = points.get(2);
    o0.vertex(p.x, p.y);
    p = points.get(4);
    o0.vertex(p.x, p.y);
    p = points.get(7);
    o0.vertex(p.x, p.y);
    p = points.get(9);
    o0.vertex(p.x, p.y);
    p = points.get(12);
    o0.vertex(p.x, p.y);
    p = points.get(14);
    o0.vertex(p.x, p.y);
    p = points.get(17);
    o0.vertex(p.x, p.y);
    p = points.get(19);
    o0.vertex(p.x, p.y);
    p = points.get(22);
    o0.vertex(p.x, p.y);
    p = points.get(24);
    o0.vertex(p.x, p.y);
    o0.fill(colors[11]);
    o0.noStroke();
    o0.endShape(CLOSE);

    shape(o0);
    shape(n0);
    shape(n1);
    shape(n2);
    shape(n3);
    shape(n4);
    shape(n5);
    shape(n6);
    shape(n7);
    shape(n8);
    shape(n9);
    shape(f0);
  }
}
