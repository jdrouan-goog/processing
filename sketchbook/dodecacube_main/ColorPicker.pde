color WHITE  = color(0xFF);
color GREY   = color(0xA0);
color RED    = color(0xFF, 0x00, 0x00);
color GREEN  = color(0x00, 0xFF, 0x00);
color BLUE   = color(0x00, 0x00, 0xFF);
color YELLOW = color(0xFF, 0xFF, 0x00);
color PINK   = color(0xFF, 0xA8, 0xDF);
color HUNTER = color(0x35, 0x5E, 0x3B);
color LTBLUE = color(0x8A, 0xB8, 0xFE);
color PURPLE = color(0xA0, 0x20, 0xF0);
color BEIGE  = color(0xF5, 0xF5, 0xDC);
color ORANGE = color(0xFF, 0xA5, 0x00);

class ColorArray {
  color[] arr;
  
  ColorArray() {
    arr = new color[12];
  }

  void makePink() {
    arr[0] = PINK;
    arr[1] = RED;
    arr[2] = WHITE;
    arr[3] = BLUE;
    arr[4] = YELLOW;
    arr[5] = GREEN;
    arr[6] = ORANGE;
    arr[7] = GREY;
    arr[8] = LTBLUE;
    arr[9] = BEIGE;
    arr[10] = HUNTER;
    arr[11] = PURPLE;
  }

  void makeRed() {
    arr[0] = RED;
    arr[1] = WHITE;
    arr[2] = YELLOW;
    arr[3] = BLUE;
    arr[4] = GREEN;
    arr[5] = PINK;
    arr[6] = GREY;
    arr[7] = BEIGE;
    arr[8] = LTBLUE;
    arr[9] = HUNTER;
    arr[10] = PURPLE;
    arr[11] = ORANGE;
  }

  void makePurple() {
    arr[0] = PURPLE;
    arr[1] = ORANGE;
    arr[2] = GREEN;
    arr[3] = YELLOW;
    arr[4] = BLUE;
    arr[5] = WHITE;
    arr[6] = RED;
    arr[7] = HUNTER;
    arr[8] = BEIGE;
    arr[9] = LTBLUE;
    arr[10] = GREY;
    arr[11] = PINK;
  }

  void makeBlue() {
    arr[0] = BLUE;
    arr[1] = WHITE;
    arr[2] = PURPLE;
    arr[3] = YELLOW;
    arr[4] = ORANGE;
    arr[5] = GREEN;
    arr[6] = GREY;
    arr[7] = PINK;
    arr[8] = BEIGE;
    arr[9] = RED;
    arr[10] = HUNTER;
    arr[11] = LTBLUE;
  }

  void makeWhite() {
    arr[0] = WHITE;
    arr[1] = PURPLE;
    arr[2] = ORANGE;
    arr[3] = YELLOW;
    arr[4] = GREEN;
    arr[5] = BLUE;
    arr[6] = PINK;
    arr[7] = RED;
    arr[8] = BEIGE;
    arr[9] = HUNTER;
    arr[10] = LTBLUE;
    arr[11] = GREY;
  }

  void makeHunter() {
    arr[0] = HUNTER;
    arr[1] = PURPLE;
    arr[2] = YELLOW;
    arr[3] = WHITE;
    arr[4] = BLUE;
    arr[5] = RED;
    arr[6] = PINK;
    arr[7] = BEIGE;
    arr[8] = GREY;
    arr[9] = LTBLUE;
    arr[10] = ORANGE;
    arr[11] = GREEN;
  }

  void makeBeige() {
    arr[0] = BEIGE;
    arr[1] = PINK;
    arr[2] = GREEN;
    arr[3] = GREY;
    arr[4] = ORANGE;
    arr[5] = LTBLUE;
    arr[6] = PURPLE;
    arr[7] = HUNTER;
    arr[8] = WHITE;
    arr[9] = RED;
    arr[10] = BLUE;
    arr[11] = YELLOW;
  }

  void makeGrey() {
    arr[0] = GREY;
    arr[1] = BEIGE;
    arr[2] = RED;
    arr[3] = PINK;
    arr[4] = BLUE;
    arr[5] = GREEN;
    arr[6] = YELLOW;
    arr[7] = ORANGE;
    arr[8] = PURPLE;
    arr[9] = LTBLUE;
    arr[10] = HUNTER;
    arr[11] = WHITE;
  }

  void makeLtblue() {
    arr[0] = LTBLUE;
    arr[1] = HUNTER;
    arr[2] = RED;
    arr[3] = BEIGE;
    arr[4] = PINK;
    arr[5] = GREY;
    arr[6] = GREEN;
    arr[7] = ORANGE;
    arr[8] = YELLOW;
    arr[9] = PURPLE;
    arr[10] = WHITE;
    arr[11] = BLUE;
  }

  void makeGreen() {
    arr[0] = GREEN;
    arr[1] = ORANGE;
    arr[2] = LTBLUE;
    arr[3] = GREY;
    arr[4] = BEIGE;
    arr[5] = PINK;
    arr[6] = RED;
    arr[7] = BLUE;
    arr[8] = WHITE;
    arr[9] = YELLOW;
    arr[10] = PURPLE;
    arr[11] = HUNTER;
  }

  void makeYellow() {
    arr[0] = YELLOW;
    arr[1] = PURPLE;
    arr[2] = LTBLUE;
    arr[3] = ORANGE;
    arr[4] = GREY;
    arr[5] = GREEN;
    arr[6] = PINK;
    arr[7] = BLUE;
    arr[8] = RED;
    arr[9] = WHITE;
    arr[10] = HUNTER;
    arr[11] = BEIGE;
  }

  void makeOrange() {
    arr[0] = ORANGE;
    arr[1] = GREEN;
    arr[2] = BLUE;
    arr[3] = YELLOW;
    arr[4] = WHITE;
    arr[5] = PURPLE;
    arr[6] = HUNTER;
    arr[7] = LTBLUE;
    arr[8] = BEIGE;
    arr[9] = GREY;
    arr[10] = PINK;
    arr[11] = RED;
  }
}

class ColorPicker {
  HashMap<String, ColorArray> map;
  
  ColorPicker() {
    map = new HashMap<>();

    ColorArray pink = new ColorArray();
    pink.makePink();
    map.put("pink", pink);

    ColorArray red = new ColorArray();
    red.makeRed();
    map.put("red", red);

    ColorArray purple = new ColorArray();
    purple.makePurple();
    map.put("purple", purple);

    ColorArray blue = new ColorArray();
    blue.makeBlue();
    map.put("blue", blue);

    ColorArray white = new ColorArray();
    white.makeWhite();
    map.put("white", white);

    ColorArray hunter = new ColorArray();
    hunter.makeHunter();
    map.put("hunter", hunter);

    ColorArray beige = new ColorArray();
    beige.makeBeige();
    map.put("beige", beige);

    ColorArray grey = new ColorArray();
    grey.makeGrey();
    map.put("grey", grey);

    ColorArray ltblue = new ColorArray();
    ltblue.makeLtblue();
    map.put("ltblue", ltblue);

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
