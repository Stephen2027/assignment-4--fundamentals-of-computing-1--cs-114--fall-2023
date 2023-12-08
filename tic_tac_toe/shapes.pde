void drawCircleinGrid(int row, int col, float squareSize) {
  float x = col * squareSize + squareSize / 2;
  float y = row * squareSize + squareSize / 2;
  float diameter = squareSize * 0.8;
  drawCircle(x, y, diameter);
}

void drawCrossinGrid(int row, int col, float squareSize) {
  float x = col * squareSize;
  float y = row * squareSize;
  float size = squareSize * 0.8;
  drawCross(x + squareSize / 2, y + squareSize / 2, size);
}

void drawCircle(float x, float y, float diameter) {
  ellipse(x, y, diameter, diameter);
}

void drawCross(float x, float y, float size) {
  line(x - size / 2, y - size / 2, x + size / 2, y + size / 2);
  line(x - size / 2, y + size / 2, x + size / 2, y - size / 2);
}
