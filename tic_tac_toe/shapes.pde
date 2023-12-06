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


void drawBoard() {
  background(255);
  strokeWeight(4);
  stroke(0);

  line(0, squareSize, width, squareSize * 1);
  line(0, squareSize * 2, width, squareSize * 2);

  line(squareSize, 0, squareSize, height);
  line(squareSize * 2, 0, squareSize * 2, height);

  for (int i = 0; i < boardSize; ++i) {
    for (int j = 0; j < boardSize; ++j) {
      if (board[i][j] == userSymbol) {
        drawCircleinGrid(i, j, squareSize);
      } else if (board[i][j] == computerSymbol) {
        drawCrossinGrid(i, j, squareSize);
      }
    }
  }
}

int getMiniMax(int depth, boolean isMax) {
  if (checkWin(userSymbol)) {
    return -10;
  } else if (checkWin(computerSymbol)) {
    return 10;
  } else if (boardFull()) {
    return 0;
  }

  if (isMax) {
    int bestScore = Integer.MIN_VALUE;

    for (int i = 0; i < boardSize; i++) {
      for (int j = 0; j < boardSize; j++) {
        if (board[i][j] == ' ') {
          board[i][j] = computerSymbol;
          bestScore = max(bestScore, getMiniMax(depth + 1, !isMax));
          board[i][j] = ' ';
        }
      }
    }

    return bestScore;
  } else {
    int bestScore = Integer.MAX_VALUE;

    for (int i = 0; i < boardSize; i++) {
      for (int j = 0; j < boardSize; j++) {
        if (board[i][j] == ' ') {
          board[i][j] = userSymbol;
          bestScore = min(bestScore, getMiniMax(depth + 1, !isMax));
          board[i][j] = ' ';
        }
      }
    }

    return bestScore;
  }
}

int[] findBestMove() {
  int bestScore = Integer.MIN_VALUE;
  int[] bestMove = new int[] {-1, -1};

  for (int rowNum = 0; rowNum < boardSize; ++rowNum) {
    for (int colNum = 0; colNum < boardSize; ++colNum) {
      if(board[rowNum][colNum] == ' ') {
        board[rowNum][colNum] = computerSymbol;
        int score = getMiniMax(0, false);
        board[rowNum][colNum] = ' ';

        if (score > bestScore) {
          bestScore = score;
          bestMove[0] = rowNum;
          bestMove[1] = colNum;
        }
      }
    }
  }

  return bestMove;
}

boolean isEmptySquare(int num1, int num2) {
  return board[num1][num2] == ' ';
}
