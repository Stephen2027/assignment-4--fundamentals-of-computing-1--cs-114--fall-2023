char[][] board = new char[3][3];
boolean gameInProgress = true;

// Initialize board with empty spaces
void initializeBoard() {
  for (int row = 0; row < boardSize; row++) {
    for (int col = 0; col < boardSize; col++) {
      board[row][col] = ' ';
    }
  }
}

// Display the current state of the board
void displayBoard() {
  for (int row = 0; row < boardSize; row++) {
    for (int col = 0; col < boardSize; col++) {
      print(board[row][col] + " ");
    }
    println();
  }
}

// Make move on the board
void makeMove(int row, int col, char player) {
  board[row][col] = player;
  displayBoard(); // update the board
}

// Find the best move for the computer then update the board
void computerMove() {
  int[] move = findBestMove();
  makeMove(move[0], move[1], computerSymbol);
}

// Check for a win by looking at rows, columns, and diagonals
boolean checkWin(char player) {
  for (int row = 0; row < boardSize; row++) {
    if ((board[row][0] == player && board[row][1] == player && board[row][2] == player) || (board[0][row] == player && board[1][row] == player && board[2][row] == player)) {
      return true;
    }
  }
  if ((board[0][0] == player && board[1][1] == player && board[2][2] == player) || (board[0][2] == player && board[1][1] == player && board[2][0] == player)) {
    return true;
  }
  return false;
}

// Check to see if the board is full
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

// Make sure move is in valid range
boolean validMove(int index) {
  return index >= 0 && index < boardSize * boardSize;
}

// Make sure a specific square is empty
boolean emptySquare(int row, int col) {
  return board[row][col] == ' ';
}

int[] findEmptySquare() {
  // Create array to store row and column corrdinate of empty square
  int[] move = new int[2];
  move[0] = int(random(boardSize));
  move[1] = int(random(boardSize));
  // Continue generating random positions until an empty square
  while (!isEmptySquare(move[0], move[1])) {
    move[0] = int(random(boardSize));
    move[1] = int(random(boardSize));
  }
  return move;
}
// Draw the graphics of the game board
void drawBoard() {
  background(255);
  strokeWeight(4);
  stroke(0);

  // Draw horizontal lines
  line(0, squareSize, width, squareSize * 1);
  line(0, squareSize * 2, width, squareSize * 2);

  // Draw vertical lines
  line(squareSize, 0, squareSize, height);
  line(squareSize * 2, 0, squareSize * 2, height);

  // Create symbols in their positions on the board
  for (int currentRow = 0; currentRow < boardSize; ++currentRow) {
    for (int currentCol = 0; currentCol < boardSize; ++currentCol) {
      if (board[currentRow][currentCol] == userSymbol) {
        drawCircleinGrid(currentRow, currentCol, squareSize);
      } else if (board[currentRow][currentCol] == computerSymbol) {
        drawCrossinGrid(currentRow, currentCol, squareSize);
      }
    }
  }
}

// Create Minimax algorithm for the computer to find the best move
int getMiniMax(int depth, boolean isMax) {
  if (checkWin(userSymbol)) {
    return -1; // Placeholder for user victory
  } else if (checkWin(computerSymbol)) {
    return 1; // Placeholder for computer victory
  } else if (boardFull()) {
    return 0; // Placeholder for a draw
  }

  // Maximize player if current move is for the user
  if (isMax) {
    int bestScore = -1;

    // Loop through each row and column on the board
    for (int row = 0; row < boardSize; row++) {
      for (int col = 0; col < boardSize; col++) {
        if (board[row][col] == ' ') {
          board[row][col] = computerSymbol;
          bestScore = max(bestScore, getMiniMax(depth + 1, !isMax));
          board[row][col] = ' ';
        }
      }
    }

    return bestScore;
  } else { // Minimize player if current move is for the user
    int bestScore = Integer.MAX_VALUE;
    // Go through each empty square
    for (int row = 0; row < boardSize; row++) {
      for (int col = 0; col < boardSize; col++) {
        if (board[row][col] == ' ') {
          board[row][col] = userSymbol;
          // Evaluate the score for this move
          bestScore = min(bestScore, getMiniMax(depth + 1, !isMax));
          board[row][col] = ' ';
        }
      }
    }

    return bestScore;
  }
}
// Find best move using Minimax algorithm
int[] findBestMove() {
  int bestScore = Integer.MIN_VALUE;
  int[] bestMove = new int[] {-1, -1};

  // Go through all possible moves
  for (int rowNum = 0; rowNum < boardSize; ++rowNum) {
    for (int colNum = 0; colNum < boardSize; ++colNum) {
      if(board[rowNum][colNum] == ' ') {
        board[rowNum][colNum] = computerSymbol;
        // Evaluate the score with the Minimax algorithm
        int score = getMiniMax(0, false);
        board[rowNum][colNum] = ' ';

        // Update best move if the current score is better
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
// Checks if the inputted square is empty
boolean isEmptySquare(int row, int col) {
  return board[row][col] == ' ';
}
