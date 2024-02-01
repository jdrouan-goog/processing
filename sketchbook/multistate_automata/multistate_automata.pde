color[] stateColors = {
  color(255, 255, 0),
  color(255, 0, 255),
  color(0, 255, 255)
};

int n = 3; // Number of states

int w = 20;
int h = 20;

int[][] cells;
int cols;
int rows;

void setup() {
  size(200, 100);

  cols = width/w;
  rows = height/h;
  cells = new int[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      System.out.println("row " + j + " of " + rows + " col " + i + " of " + cols);
      cells[i][j] = (i + j) % n;
    }
  }

  noStroke();
}

void draw() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      fill(stateColors[cells[i][j]]);
      int x = i * w;
      int y = j * h;
      rect(x, y, w, h);
      System.out.println("row " + j + " of " + rows + " col " + i + " of " + cols + " = " + cells[i][j]);
    }
  }

  noLoop();
  //for (int i = 0; i < cells.length; i++) {
  //  switch(cells[i]) {
  //    case 0:
  //        fill(255, 255, 160);
  //        break;
  //    case 1:
  //        fill(255, 0, 255);
  //        break;
  //    case 2:
  //        fill(0, 255, 255);
  //        break;
  //  }
  //  int x = i * w;
  //  square(x, y, w);
  //}

  //int[] nextCells = new int[cells.length];
  //for (int i = 0; i < cells.length; i++) {
  //  int left = cells[((i - 1) + cells.length) % cells.length];
  //  int right = cells[((i + 1) + cells.length) % cells.length];
  //  int state = cells[i];
  //  int newState = calculateState(left, state, right);
  //  nextCells[i] = newState;
  //}

  //cells = nextCells;
  //if (y > height) {
  //  noLoop();
  //}
  //y += w;
}

int calculateState(int a, int b, int c) {
  return (a + b - c) % 3;
}
