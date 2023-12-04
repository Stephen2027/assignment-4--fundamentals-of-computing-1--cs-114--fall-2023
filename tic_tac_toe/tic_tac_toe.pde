void setup() {
  size(500, 500);

  initializeBoard();

  println("Computer starts. Press a key between 0 and 8 to make your move.");
}

void draw() {

  drawBoard();

  if (keyPressed && isGameactive) {
    int index = key - '0';
    if (validMove(index)) {
      int row = index / boardSize;
      int col = index % boardSize;

      if (emptySquare(row, col)) {
        makeMove(row, col, userSymbol);

        if (checkWin(userSymbol)) {
          println("The user won!");
          isGameactive = false;
        } else {
          computerMove();

          if (checkWin(computerSymbol)) {
            println("The computer won!");
            isGameactive = false;
          } else if (boardFull()) {
            println("Neither you nor the computer has won");
            isGameactive = false;
          } else {
            println("Game still in progress");
          }
        }
      } else {
        println("Invalid move. Square already taken. Press a key between 0 and 8");
      }
    } else {
      println("Invalid move. Please select a number between 0 and 8 to amke your move");
    }
  }
}

void computerMove() {
  int index;
  do {
    index = int(random(9));
  } while (validMove(index));

  int row = index / boardSize;
  int col = index % boardSize;

  makeMove(row, col, computerSymbol);
}

void endGame(string result) {
  println(result);
  isGameactive = false;
}

boolean validMove(int index) {
  return index >= 0 && index < boardSize * boardSize
}
