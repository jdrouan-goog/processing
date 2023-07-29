class FlipState {
  int numFlips;
  boolean[] state;
  
  FlipState (int n) {
    numFlips = getTriangleNumber(n/2);
    state = new boolean[numFlips];
  }
  
  int getTriangleNumber(int n) {
    int sum = n;
    for (int i = 1; i < n; i++) {
      sum += i;
    }
    return sum;
  }

  boolean getState(int i, int j) {
    int x = min(abs(i), abs(j));
    int y = max(abs(i), abs(j));
    int idx = x + ((y-1)*y)/2;
    return state[idx];
  }

  void toggleState(int i, int j) {
    int x = min(i, j);
    int y = max(i, j);
    int idx = x + ((y-1)*y)/2;
    state[idx] = !state[idx];
  }
}
