/*
How does Reversi work?
 Players take turns to place pieces on the board to capture the enemy's pieces
 A valid move needs to bookend enemy pieces with your pieces. At that point, all the pieces in between flip over.
 We can test for bookend moves by
 locate the square the mouse is hovering over
 draw a line segment out the centre of that square to each of your pieces
 test all the enemy pieces to see if they sit on that line segment
 
 */

ArrayList<Piece> pieces;

int squareCount = 8;
int activeCol, activeRow;
PVector centre;
float res = 100;
float diagDist = PVector.dist(new PVector(0,0), new PVector(res, res)); // so it calculates the same
int activePlayer = 1;
boolean isValidMove = false;
boolean isBlank = false;
boolean isEnemyAdjacent = false;
boolean doesBookend = true;

void setup() {
  size(800, 800);
  pieces = new ArrayList<Piece>();
  centre = new PVector(0,0);
  locateMouse();
  
  initBoard();
}

void draw() {
  background(0);
  locateMouse();
  evalMove();
  hover();
  drawBoard();
  drawPieces();
  drawOverlay();
}

void locateMouse() {
  activeCol = int(mouseX/res);
  activeRow = int(mouseY/res);
  centre.set((activeCol+0.5)*res, (activeRow + 0.5)*res);
}

void hover() {
  // detect where the mouse is
  if (isBlank) {
    fill(0, 0, 255, 200);
    rect(activeCol*res, activeRow*res, res, res);
  } else {
    fill(255, 200);
    rect(activeCol*res, activeRow*res, res, res);
  }
}

void evalMove() {
  isBlank = true;
  
  // a move is valid if the square is unoccupied
  for(Piece p: pieces){
   if(p.doesMatch(activeCol, activeRow)){
     isBlank = false;
     return; // no need to check further
   }
  }
  
  // a move is valid if it's next to an enemy piece
  for(Piece p: pieces){
    // if an enemy
    if(p.player != activePlayer){
      // pieces should either be res away or sqrt(2)*res away
      float d = PVector.dist(centre, p.pos);
      if(d == res || d == diagDist){
        isEnemyAdjacent = true;
      }
    }
  }
  
  // checking for Bookending = points that s
  
   
  // if there are no matches, i.e. we're on a blank square, then see if 
  isValidMove = isBlank && isEnemyAdjacent && doesBookend;
}

void drawPieces() {
  for (Piece p : pieces) {
    p.update();
    p.show();
  }
}

void initBoard() {
  // adds pieces to players
  pieces.add(new Piece(1, 3, 3));
  pieces.add(new Piece(1, 4, 4));
  pieces.add(new Piece(2, 3, 4));
  pieces.add(new Piece(2, 4, 3));
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

void drawOverlay() {
  for (Piece p : pieces) {
    if (p.player == activePlayer) {
      line(p.pos.x, p.pos.y, centre.x, centre.y);
    }
  }
}



void mousePressed() {
  if (mouseButton == LEFT) {
    for (Piece p : pieces) {
      if (p.player == activePlayer) {
        if (p.doesMatch(activeCol, activeRow)) {
          p.animating = true;
        }
      }
    }

    swapPlayers();
  }
}

void swapPlayers() {
  if (activePlayer == 1) {
    activePlayer = 2;
  } else {
    activePlayer = 1;
  }
}
