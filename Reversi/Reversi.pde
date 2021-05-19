/*
How does Reversi work?
 
 Begin with an 8x8 grid with the centre square of 4 covered by red and blue diagonally arranged
 
 */
Cell[][] board;
int s = 8;
float res;
color player1, player2, bg, selectbg;
boolean player1Turn = true;


void setup() {
  size(800, 800);
  res = width/s;
  player1 = color(255,0,0);
  player2 = color(0,255,0);
  bg = color(255,200);
  selectbg = color(255,250);
  board = new Cell[s][s];
  initBoard();
 
}

void draw() {
  background(0);
  stroke(0);
  strokeWeight(1);
  fill(150);
  drawBoard();
  

}

void initBoard(){
 for (int col = 0; col < 8; col++) {
    for (int row = 0; row < 8; row++) {
      board[col][row] = new Cell(col, row); //coords of the corners
    }
  }
  board[3][3].player = 1;
  board[4][4].player = 1;
  board[4][3].player = 2;
  board[3][4].player = 2;
}

void drawBoard(){
  hover();
  for (int col = 0; col < 8; col++) {
    for (int row = 0; row < 8; row++) {
      board[col][row].show();
    }
  }
}

void hover(){
  // draw radial lines out in all 8 directions, noting down the locations
  // first, which square is the thing in?
  fill(bg);
  noStroke();
  int mouseRow = int(mouseX/res);
  int mouseCol = int(mouseY/res);
  //rect(mouseRow*res, mouseCol*res, res, res);
  
  // looking left
  for(int col = 0; col < mouseCol; col++){
    rect(col*res, mouseRow*res, res, res);
  } 
 
 // looking right
 for(int col = mouseCol; col < s; col ++){
     rect(col*res*res, mouseRow*res, res, res);
   }
  
  // looking up
  for(int row = 0; row < mouseRow; row++){
    rect(mouseCol*res, mouseRow*res, res, res);
  }
  
  // looking down
   for(int row = mouseRow; row < s; row++){
    rect(mouseCol*res, mouseRow*res, res, res);
  }
}
