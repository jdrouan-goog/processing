class Face {
  ColorPicker cp;
  FlipState f;
  int rotClicks;
  int size;
  String colorName;
  float squareSize;
  float extent;
  int shift;
  int start;
  int stop;

  Face(int n) {
    // n must be odd
    if (n % 2 == 0) n++;
    cp = new ColorPicker();
    rotClicks = 0;
    colorName = "white";
    size = n;
    f = new FlipState(size);
    squareSize = width/size;
    extent = squareSize/2;
    start = -(size / 2);
    stop = start + size;
  }

  void drawFace() {
    rotate((TWO_PI * rotClicks)/4);
    color[] colors = cp.getColors(colorName);
    rectMode(RADIUS);
    stroke(0);
    strokeWeight(8);
    
    for (int i = start; i < stop; i++) {
      for (int j = start; j < stop; j++) {
        int colorIdx = getColorIndex(i, j);
        fill(colors[colorIdx]);
        square (i * squareSize, j * squareSize, extent);
      }
    }
  }
  
  int getColorIndex(int i, int j) {
    if (abs(i) == abs(j)) return 0;
    if (!getClicked(i, j)) return 0;
    if (abs(i) < abs(j)) {
      if (j < 0) return 1;
      return 3;
    }
    if (i > 0) return 2;
    return 4; 
  }

  boolean getClicked(int i, int j) {
    return f.getState(i, j);
  }

  void handleMouse(int x, int y) {
    x = abs(floor(x / squareSize) + start);
    y = abs(floor(y / squareSize) + start);
    if (x == y) return;
    
    f.toggleState(x, y);
  }
}
