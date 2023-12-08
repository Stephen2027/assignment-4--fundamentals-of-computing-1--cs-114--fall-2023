import java.lang.String;

void setup() {
  size(500, 500);

  initializeBoard();
  isGameactive = true;

  computerMove();
  println("Computer starts. Press a key between 0 and 8 to make your move.");
}

void endGame(String result) {
  println(result);
  isGameactive = false;
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
      println("Invalid move. Please select a number between 0 and 8 to make your move");
    }
  }
}
