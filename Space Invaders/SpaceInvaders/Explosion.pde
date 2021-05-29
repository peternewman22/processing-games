class Explosion {
  // explodes outwards, and then fades out
  float plumeLength = 0;
  float plumeLengthMax = 80;
  float fade = 255;
  int fadeLength = 10;
  int animationFrames = 3;
  PVector pos;
  boolean isFinished = false;
  
    // can have two initialisers depending on if it's a mouseclick or from hiting as ship
  Explosion(int x, int y) {
    pos = new PVector(x, y);
  }
  
  Explosion(float x, float y){
    pos = new PVector(x, y);
  }

  void update() {
    if (plumeLength < plumeLengthMax) { // expand over a number of frames
      plumeLength += plumeLengthMax/animationFrames;
    } else {
      fade -= int(255/fadeLength);
    }
    if (fade < 0) {
      isFinished = true;
    }
  }

  void show() {
    if (!isFinished) {
      stroke(255,0,0,fade);
      strokeWeight(5);
      push();
      translate(pos.x, pos.y);
      for (int i = 0; i < 12; i++) {
        rotate(PI/6);
        line(20, 0, plumeLength, 0);
      }
      pop();
    }
  }
}
