

int s = 8;
float res;
float ps = 0.9;
Square[][] gameBoard;
boolean[][] validMoves;
int turnState = 1;

void setup() {
  size(800, 800);
  res = width/8;
  gameBoard = new Square[s][s];
  validMoves = new boolean[s][s];
  initBoard();
}

void draw() {
  background(0);
  drawBoard();
  hover();
  drawPieces();
}

void hover() {
  // locate relevant square
  int col = int(mouseX/res);
  int row = int(mouseY/res);
  // "highlight" the relevant square
  stroke(0);
  strokeWeight(5);
  fill(255, 200);
  rect(col*res, row*res, res, res);
}

void initBoard() {
  for (int col = 0; col < s; col ++) {
    for (int row = 0; row < s; row++) {
      gameBoard[col][row] = new Square(row, col);
      validMoves[col][row] = false;
    }
  }

  // set the 4th and 5th columns and rows to the correct thing
  gameBoard[3][3].state = 1;
  gameBoard[3][4].state = 2;
  gameBoard[4][3].state = 2;
  gameBoard[4][4].state = 1;

  evalMoves();
}

void evalMoves() {
  /*
  What constitutes a valid move in Reversi and how do you detect it?
   A valid move must bookend at least one opposing piece
   - so we have to know whose move it is
   - look around each square and if the adjacent square is:
   - blank: do nothing
   - isFriend: do nothing
   - isEnemy: keep searching in that direction (hold off on evaluating)
   - if isFriend, stop the search and change all in between to isFriend
   */
  for (int col = 0; col < s; col++) {
    for (int row = 0; row < s; row++) {
      // if the square is the active player's
      if(gameBoard[col][row].state == turnState){
        for(int i = -1; i < 2; i+=2){
          for(int j = -1; j < 2; j+=2){
            //if valid
            if(col + i > 0 && col + i < s && row + j > 0 && row + j < s){
              // if we find an enemy
              if(gameBoard[col+i][row+j].state 
            }
          }
        }
      }
    }
  }
}



void drawBoard() {
  // draw the board
  fill(255, 200);
  stroke(0);
  strokeWeight(5);
  for (int col = 0; col < s; col ++) {
    for (int row = 0; row < s; row++) {
      rect(col*res, row*res, res, res);
    }
  }
}

void drawPieces() {
  for (int col = 0; col < s; col ++) {
    for (int row = 0; row < s; row++) {
      gameBoard[col][row].show();
    }
  }
}
