/*
How does reversi work?

8x8 grid
Player 1 = Green
Player 2 = Red

Players take turns capturing each others pieces - if you can bookend another's pieces, you capture those pieces
How to detect another's pieces?
Draw rays out in all the cardinal directions and checks to see which points are hit
*/

int s = 8;
float rayLength;
float res;
ArrayList<Piece> game;
PVector cursor, end;
PVector u, d, l, r, ul, ur, dl, dr;
PVector[] dirs;



void setup(){
  size(1000, 1000);
  res = width/s;
  game = new ArrayList<Piece>();
  cursor = new PVector(0,0);
  end = new PVector(0,0);
  rayLength = 2*width;
  u = new PVector(0,-1);
  d = new PVector(0,1);
  l = new PVector(-1,0);
  r = new PVector(1,0);
  ul = new PVector(-1, -1);
  ur = new PVector(1,-1);
  dl = new PVector(-1,1);
  dr = new PVector(-1,1);
  dirs = [u,d,l,r,ul, ur,dl,dr];
}

void draw(){
  background(0);
  drawGrid();
  hover();
}

void drawGrid(){
  rectMode(CORNER);
  stroke(0);
  strokeWeight(5);
  fill(255,200);
  for(int x = 0; x < s; x++){
    for(int y = 0; y < s; y ++){
      rect(x*res, y*res, res, res);
    }
  }
}

void hover(){
  stroke(0);
  strokeWeight(3);
  // work out which square the thing is in
  float cursorX = int(mouseX/res)*res + res/2;
  float cursorY = int(mouseY/res)*res + res/2;
  cursor.set(cursorX, cursorY);
  
}
