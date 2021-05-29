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
  int row, col;
  Piece(int player_, int row_, int col_) {
    player = player_;
    row = row_;
    col = col_;
    pos = new PVector((col+0.5)*res, (row+0.5)*res);
  }

  void toggle() {
    if (player == 1) {
      player = 2;
    } else {
      player = 1;
    }
  }

  void update() {
    if (animating) {
      w = s*cos(a);
      // if finished
      if (a > PI) {
        a = 0;
        animating = false;
        hasFlipped = false;
      } else if (a > PI/2 && !hasFlipped) {
        toggle();
        hasFlipped = true;
      }
      a += PI/animationFrames;
    }
  }

  boolean isClicked(int col_, int row_) {
    if (col == col_ && row == row_) {
      println("Piece matched at (" + str(col) + ", " + str(row) + ")");
      return true;
    } else {
      return false;
    }
  }

  void show() {
    if (player == 1) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
    ellipse(pos.x, pos.y, w, s);
  }
}
