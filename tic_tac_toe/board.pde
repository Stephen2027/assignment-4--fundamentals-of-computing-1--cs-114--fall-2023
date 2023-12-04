char[][] board = new char[gridSize][gridSize];
boolean gameInProgress = true

void initializeBoard() {
  for (int row = 0; row < gridSize; row++) {
    for (int col = 0; col < gridSize; col++) {
      board[row][col] = ' ';
    }
  }
}

void displayBoard() {
  for (int row = 0; row < gridSize; row++) {
    for (int col = 0; col < gridSize; col++) {
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
  for (int i = 0; i < gridSize; i++) {
    if (board[i][0] == player && board[i][1] == player && board[i][2] == player) {
      return true;
    }
    if (board[0][i] == player && board[1][i] == player && board[2][i] == player) {
      return true;
    }
  }
  if (board[0][0] == player && board[1][1] == player && board[2][2] == player) {
    return true;
  }
  if (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
    return true;
  }
  return false;
}

boolean boardFull() {
  for (int row = 0; row < gridSize; row++) {
    for (int col = 0; col < gridSize; col++) {
      if (board[row][col] == ' ') {
        return false;
      }
    }
  }
  return true;
}

boolean validMove(int index) {
  return index >= 0 && index < gridSize * gridSize;
}
boolean emptySquare(int row, int col) {
  return board[row][col] == ' ';
}

int[] findEmptySquare() {
  int[] move = new int[2];
  move[0] = int(random(gridSize));
  move[1] = int(random(gridSize));
  while (!isEmptySquare(move[0], move[1])) {
    move[0] = int(random(gridSize));
    move[1] = int(random(gridSize));
  }
  return move;
}
