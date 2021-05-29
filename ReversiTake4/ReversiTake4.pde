/*
How does Reversi work?
 Players take turns to place pieces on the board to capture the enemy's pieces
 A valid move needs to bookend enemy pieces with your pieces. At that point, all the pieces in between flip over.
 We can test for bookend moves by
 locate the square the mouse is hovering over
 draw a line segment out the centre of that square to each of your pieces
 test all the enemy pieces to see if they sit on that line segment
 
 */

ArrayList<Piece> player1, player2;
int squareCount = 8;
float res = 100;

void setup() {
  size(800, 800);
  player1 = new ArrayList<Piece>();
  player2 = new ArrayList<Piece>();
  initBoard();
}

void draw() {
  background(0);
  hover();
  drawBoard();
  drawPieces();
}

void drawPieces() {
  // player1 pieces
  for (Piece p : player1) {
    p.update();
    p.show();
  }
  // player2 pieces
  for (Piece p : player2) {
    p.update();
    p.show();
  }
}

void initBoard() {
  // adds pieces to players
  player1.add(new Piece(1, 3, 3));
  player1.add(new Piece(1, 4, 4));
  player2.add(new Piece(2, 3, 4));
  player2.add(new Piece(2, 4, 3));
}

void drawBoard() {
  stroke(0);
  strokeWeight(5);
  fill(255, 200);
  for (int col = 0; col < squareCount; col ++) {
    for (int row = 0; row < squareCount; row ++) {
      rect(col*res, row*res, res, res);
    }
  }
}

void hover() {
  // detect where the mouse is
  int col = int(mouseX/res);
  int row = int(mouseY/res);
  fill(255, 200);
  rect(col*res, row*res, res, res);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    int col = int(mouseX/res);
    int row = int(mouseY/res);
    for(Piece p: player1){
      if(p.isClicked(col, row)){
        p.animating = true;
      }
    }
    for(Piece p: player2){
      if(p.isClicked(col, row)){
        p.animating = true;
      }
    }
  }
}
