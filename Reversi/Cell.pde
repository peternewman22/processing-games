class Cell {
  // shows depending on player
  // has a row and column
  PVector loc;
  boolean selected = false;
  int player = 0; // default: neutral
  Cell(float row, float col) {
    loc = new PVector(row*res, col*res);
  }

  void show() {
    // draw the rectangle
    if (selected) {
      fill(selectbg);
    } else {
      fill(bg);
    }

    stroke(0);
    strokeWeight(5);
    rect(loc.x, loc.y, res, res);

    // draw the player token
    noStroke();
    switch(player) {
    case 1:
      fill(player2);
      ellipse(loc.x + res/2, loc.y + res/2, res*0.9, res*0.9);
      break;
    case 2:
      fill(player1);
      ellipse(loc.x + res/2, loc.y + res/2, res*0.9, res*0.9);
      break;
    }
  }

  void toggle() {
    if (player == 1) {
      player = 2;
    } else {
      player = 1;
    }
  }
}
