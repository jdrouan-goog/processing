import java.util.Random; //<>//

color[] colorMap = {
  color(255, 255, 255), // white
  color(0, 0, 255), // blue
  color(0, 255, 255), // cyan
  color(0, 255, 0), // gren
  color(0, 0, 0), // black
  color(255, 255, 0), // yellow
  color(255, 0, 255), // magenta
  color(255, 0, 0), // red
  color(127, 127, 127) // grey
};

int n = 4; // Number of states (max = colorMap size)

int w = 1;
int h = 1;

int[][] cells;
int cols;
int rows;

void setup() {
  size(800, 600);
  //frameRate(30);

  cols = width/w;
  rows = height/h;
  cells = new int[cols][rows];

  Random rand = new Random();
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      cells[i][j] = rand.nextInt(n);
    }
  }

  noStroke();
}

void draw() {

  int[][] newCells = new int[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      fill(colorMap[cells[i][j]]);
      rect(i * w, j * h, w, h);

      newCells[i][j] = calculateState(i, j);
    }
  }

  cells = newCells;
//  if (frameCount % 1000 == 1) saveFrame();
  if (frameCount > 9999) noLoop();
}

int calculateState(int i, int j) {
  int left = ((i - 1) + cols) % cols;
  int right = (i + 1) % cols;
  int up = ((j - 1) + rows) % rows;
  int down = (j + 1) % rows;

  int[] neighbors = {
    cells[left][up],
    cells[i][up],
    cells[right][up],
    cells[left][j],
    cells[right][j],
    cells[left][down],
    cells[i][down],
    cells[right][down]
  };

  int defender = cells[i][j];
  int hits = 0;

  for (int neighbor : neighbors) {
    if ((n + defender - neighbor) % n == n - 1) {
      hits++;
    }
    if (hits > 2) return neighbor;
  }

  return defender;
}

void mouseClicked() {
  //saveFrame();
}
