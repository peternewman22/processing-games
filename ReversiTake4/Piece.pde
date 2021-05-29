class Piece {
  /*
  Piece class contains the animation for flipping
   
   */
  int player;
  PVector pos;
  boolean animating = false;
  boolean hasFlipped = false;
  int animationFrames = 20;
  float a = 0;
  float aMax = PI;
  float s = res*0.9;
  float w = s*cos(a);
  Piece(int player_, int row, int col) {
    player = player_;
    pos = new PVector((col+0.5)*res, (row+0.5)*res);
  }
  
  void toggle(){
    if(player == 1){
      player = 2;
    } else {
      player = 1;
    }
  }

  void update() {
    if(animating){
      w = s*cos(a);
      // if finished
      if(a > PI){
        a = 0;
        animating = false;
        hasFlipped = false;
      } else if(a > PI/2 && !hasFlipped) {
        toggle();
        hasFlipped = true;
      }
      a += PI/animationFrames;
    }
  }
  
  boolean isClicked(int col, int row){
    return new PVector((col+0.5)*res, (row+0.5)*res) == pos;
  }

  void show(){
    if (player == 1) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
    ellipse(pos.x, pos.y, w, s);
  }
}
