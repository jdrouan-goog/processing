color WHITE  = color(0xFF);
color YELLOW = color(0xFF, 0xFF, 0x00);
color GREEN  = color(0x00, 0xFF, 0x00);
color RED    = color(0xFF, 0x00, 0x00);
color BLUE   = color(0x00, 0x00, 0xFF);
color ORANGE = color(0xFF, 0xA5, 0x00);

class ColorArray {
  color[] arr;
  
  ColorArray() {
    arr = new color[5];
  }

  void makeRed() {
    arr[0] = RED;
    arr[1] = BLUE;
    arr[2] = YELLOW;
    arr[3] = GREEN;
    arr[4] = WHITE;
  }

  void makeYellow() {
    arr[0] = YELLOW;
    arr[1] = ORANGE;
    arr[2] = GREEN;
    arr[3] = RED;
    arr[4] = BLUE;
  }

  void makeBlue() {
    arr[0] = BLUE;
    arr[1] = WHITE;
    arr[2] = ORANGE;
    arr[3] = YELLOW;
    arr[4] = RED;
  }

  void makeOrange() {
    arr[0] = ORANGE;
    arr[1] = GREEN;
    arr[2] = YELLOW;
    arr[3] = BLUE;
    arr[4] = WHITE;
  }


  void makeGreen() {
    arr[0] = GREEN;
    arr[1] = WHITE;
    arr[2] = RED;
    arr[3] = YELLOW;
    arr[4] = ORANGE;
  }

  void makeWhite() {
    arr[0] = WHITE;
    arr[1] = ORANGE;
    arr[2] = BLUE;
    arr[3] = RED;
    arr[4] = GREEN;
  }
}

class ColorPicker {
  HashMap<String, ColorArray> map;
  
  ColorPicker() {
    map = new HashMap<>();

    ColorArray red = new ColorArray();
    red.makeRed();
    map.put("red", red);

    ColorArray blue = new ColorArray();
    blue.makeBlue();
    map.put("blue", blue);

    ColorArray white = new ColorArray();
    white.makeWhite();
    map.put("white", white);

    ColorArray green = new ColorArray();
    green.makeGreen();
    map.put("green", green);

    ColorArray yellow = new ColorArray();
    yellow.makeYellow();
    map.put("yellow", yellow);

    ColorArray orange = new ColorArray();
    orange.makeOrange();
    map.put("orange", orange);
  }
  
  color[] getColors(String name) {
    ColorArray c = map.get(name);
    return c.arr;
  }
}
