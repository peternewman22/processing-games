/*
How does Reversi work?
 
 Begin with an 8x8 grid with the centre square of 4 covered by red and blue diagonally arranged
 
 */
PVector[][] board;
float res;


void setup() {
  size(800, 800);
  res = width/8;
  board = new PVector[8][8];
  for (int col = 0; col < 8; col++) {
    for (int row = 0; row < 8; row++) {
      board[col][row] = new PVector(col*res, row*res); //coords of the corners
    }
  }
}

void draw() {
  background(0);
  stroke(0);
  strokeWeight(1);
  fill(150);
  for (int col = 0; col < 8; col++) {
    for (int row = 0; row < 8; row++) {
      PVector cnr = board[col][row];
      rect(cnr.x, cnr.y, res, res);
    }
  }
}

void hover(){
  
}
