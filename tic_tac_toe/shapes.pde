void drawCircleinGrid(int row, int col, float squareSize) {
  float positionX = col * squareSize + squareSize / 2;
  float positionY = row * squareSize + squareSize / 2;
  float diameter = squareSize * 0.8;
  drawCircle(positionX, positionY, diameter);
}

void drawCrossinGrid(int row, int col, float squareSize) {
  float positionX = col * squareSize;
  float positionY = row * squareSize;
  float size = squareSize * 0.8;
  drawCross(positionX + squareSize / 2, positionY + squareSize / 2, size);
}

void drawCircle(float positionX, float positionY, float diameter) {
  ellipse(positionX, positionY, diameter, diameter);
}

void drawCross(float positionX, float positionY, float size) {
  line(positionX - size / 2, positionY - size / 2, positionX + size / 2, positionY + size / 2);
  line(positionX - size / 2, positionY + size / 2, positionX + size / 2, positionY - size / 2);
}
