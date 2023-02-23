Dodecacube cube;

void setup() {
  size(500, 500);
  cube = new Dodecacube();
  printHelp();
}

void draw() {
  background(0);
  translate(width/2, height/2);

  cube.drawCube();
  noLoop();
}

void mouseClicked() {
  cube.rotClicks++;
  loop();
}

void keyTyped() {
  switch(key) {
  case 'R':
    cube.rotClicks++;
    break;
  case 'r':
    cube.colorName = "red";
    break;
  case 'p':
    cube.colorName = "pink";
    break;
  case 'P':
    cube.colorName = "purple";
    break;
  case 'B':
    cube.colorName = "blue";
    break;
  case 'w':
    cube.colorName = "white";
    break;
  case 'h':
    cube.colorName = "hunter";
    break;
  case 'e':
    cube.colorName = "beige";
    break;
  case 'g':
    cube.colorName = "grey";
    break;
  case 'b':
    cube.colorName = "ltblue";
    break;
  case 'G':
    cube.colorName = "green";
    break;
  case 'y':
    cube.colorName = "yellow";
    break;
  case 'o':
    cube.colorName = "orange";
    break;
  }
  loop();
}

void printHelp() {
  println("Press 'R' to rotate. Change center color with key:");
  println("r: red     | p: pink   | P: purple | B: blue");
  println("w: white   | h: hunter | e: beige  | g: grey");
  println("b: lt blue | G: green  | y: yellow | o: orange");
}
