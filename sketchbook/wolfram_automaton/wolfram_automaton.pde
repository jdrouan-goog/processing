import java.util.Arrays;

int w = 1;
int y = 0;
Boolean[] cells;

void setup() {
  size(800, 600);

  cells = new Boolean[width / w];
  Arrays.fill(cells, false);
  cells[cells.length/2] = true;

  background(255);
  noStroke();
}

void draw() {

  for (int i = 0; i < cells.length; i++) {
    if (cells[i] == true) {
      fill(0);
    } else {
      fill(255);
    }
    int x = i * w;
    square(x, y, w);
  }

  Boolean[] nextCells = new Boolean[cells.length];
  for (int i = 0; i < cells.length; i++) {
    Boolean left = cells[((i - 1) + cells.length) % cells.length];
    Boolean right = cells[((i + 1) + cells.length) % cells.length];
    Boolean state = cells[i];
    Boolean newState = calculateState(left, state, right);
    nextCells[i] = newState;
  }

  cells = nextCells;
  if (y > height) {
    noLoop();
  }
  y += w;
}

Boolean calculateState(Boolean a, Boolean b, Boolean c) {
  if (a && b && c) return true;
  if (a && b) return false;
  if (a && c) return true;
  if (a) return true;
  if (b && c) return false;
  if (b) return true;
  if (c) return true;
  return false;
}
