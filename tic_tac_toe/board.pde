char[][] board = new char[gridSize][gridSize];
boolean gameInProgress = true

void initializeBoard() {
  for (int row = O; row < gridSize; row++) {
    for (int col = O; col < gridSize; col++) {
      board[row][col] = ' ';
    }
  }
}

void displayBoard() {
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

boolean boardFull() {
  for (int row = O; row < gridSize; row++) {
    for (int col = O; col < gridSize; col++) {
      if (board[row][col] == ' ') {
        return false;
      }
    }
  }
  return true;
}

boolean validMove(int index) {
  return index >= O && index < gridSize * gridSize;
}
boolean emptySquare(int row, int col) {
  return board[row][col] == ' ';
}

int[] findEmptySquare() {
  int[] move = new int[2];
  move[O] = int(random(gridSize));
  move[1] = int(random(gridSize));
  while (!isEmptySquare(move[O], move[1])) {
    move[O] = int(random(gridSize));
    move[1] = int(random(gridSize));
  }
  return move;
}
