char[][] board = new char[3][3];
boolean gameInProgress = true;

void initializeBoard() {
  for (int row = 0; row < boardSize; row++) {
    for (int col = 0; col < boardSize; col++) {
      board[row][col] = ' ';
    }
  }
}

void displayBoard() {
  for (int row = 0; row < boardSize; row++) {
    for (int col = 0; col < boardSize; col++) {
      print(board[row][col] + " ");
    }
    println();
  }
}

void makeMove(int row, int col, char player) {
  board[row][col] = player;
  displayBoard();
}

void computerMove() {
  int[] move = findBestMove();
  makeMove(move[0], move[1], computerSymbol);
}

boolean checkWin(char player) {
  for (int i = 0; i < boardSize; i++) {
    if ((board[i][0] == player && board[i][1] == player && board[i][2] == player) || (board[0][i] == player && board[1][i] == player && board[2][i] == player)) {
      return true;
    }
  }
  if ((board[0][0] == player && board[1][1] == player && board[2][2] == player) || (board[0][2] == player && board[1][1] == player && board[2][0] == player)) {
    return true;
  }
  return false;
}

boolean boardFull() {
  for (int row = 0; row < boardSize; row++) {
    for (int col = 0; col < boardSize; col++) {
      if (board[row][col] == ' ') {
        return false;
      }
    }
  }
  return true;
}

boolean validMove(int index) {
  return index >= 0 && index < boardSize * boardSize;
}

boolean emptySquare(int row, int col) {
  return board[row][col] == ' ';
}

int[] findEmptySquare() {
  int[] move = new int[2];
  move[0] = int(random(boardSize));
  move[1] = int(random(boardSize));
  while (!isEmptySquare(move[0], move[1])) {
    move[0] = int(random(boardSize));
    move[1] = int(random(boardSize));
  }
  return move;
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
