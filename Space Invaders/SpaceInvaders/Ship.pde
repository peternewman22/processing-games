class Ship{
// Player has an x position, show, fire, powerups
  //float x;
  //float y;
  float size;
  int bulletRate;
  boolean iAmDead;
  PVector pos;

  Ship() {

    pos = new PVector(width/2, height - shipSize);
    bulletRate = 5;
    iAmDead = false;
  }

  void show() {
    if (!iAmDead) {
      rectMode(CENTER);
      fill(255);
      noStroke();
      rect(pos.x, pos.y, shipSize, shipSize);
      fill(0);
      // draw in coolDown level
    }
  }

  void update(float vel) {
    // change x pos
    pos.x += vel;
    if (pos.x < shipSize/2) {
      pos.x = shipSize/2;
    } else if (pos.x + shipSize/2 > width) {
      pos.x = width - shipSize/2;
    }
  }

  boolean iAmHit(float x_, float y_) {
    if (x_ >= pos.x - shipSize/2 && x_ <= pos.x + shipSize/2 && y_ >= pos.y - shipSize/2 && y_ <= pos.y + shipSize/2 ) {
      print("Hit detected!");
      return true;
    }
    return false;
    // could be refactored to return A && B && C && D ?
  }

  void explode() {
    println("Showing explosion...");
    iAmDead = true;
    stroke(255,0,0);
    strokeWeight(5);
    push();
      translate(pos.x, pos.y);
      for (int i = 0; i < 12; i++) {
        rotate(PI/6);
        line(20, 0, 100, 0);
      }
    pop();
  }
}
