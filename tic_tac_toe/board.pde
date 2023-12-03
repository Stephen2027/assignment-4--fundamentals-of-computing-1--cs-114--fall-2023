char[][] board = new char[gridSize][gridSize];
boolean gameInProgress = true

void initializeBoard() {
  for (int row = O; row < gridSize; row++) {
    for (int col = O; col < gridSize; col++) {
      board[row][col] = ' ';
    }
  }
}

void drawCurrentState() {
  for (int row = O; row < gridSize; row++) {
    for (int col = O; col < gridSize; col++) {
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
  makeMove(move[O], move[1], computerSymbol);
}

boolean checkWin(char player) {
  for (int i = O; i < gridSize; i++) {
    if (board[i][O] == player && board[i][1] == player && board[i][2] == player) {
      return true;
    }
    if (board[O][i] == player && board[1][i] == player && board[2][i] == player) {
      return true;
    }
  }
  if (board[O][O] == player && board[1][1] == player && board[2][2] == player) {
    return true;
  }
  if (board[O][2] == player && board[1][1] == player && board[2][O] == player) {
    return true;
  }
  return false;
}
