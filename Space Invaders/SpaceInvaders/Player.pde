class Player extends Ship {
  // includes cooldown rates and only the one sprite
  int coolDown;
  int coolDownRate;
  PImage sprite;

  Player(PImage sprite_) {
    super();
    coolDown = 0;
    coolDownRate = 15;
    iAmDead = false;
    sprite = sprite_;
  }

  void show() {
    if (!iAmDead) {
      rectMode(CENTER);
      fill(255);
      noStroke();
      rect(pos.x, pos.y, size, size);
      imageMode(CENTER);
      image(sprite, pos.x, pos.y);
      fill(0);
      ellipse(pos.x, pos.y, 5, 5);
      // draw in coolDown level
      textAlign(LEFT);
      textSize(20);
      stroke(255);
      fill(255);
      text(str(coolDown), 20, height-20);
    }
  }

  void chargeWeapon() {
    // reduce coolDown
    if (coolDown > 0) {
      coolDown -= 1;
    }
  }
}
