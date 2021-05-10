class Player {
  // Player has an x position, show, fire, powerups
  float x;
  float y;
  float size;
  int coolDown;
  int coolDownRate;
  int bulletRate;

  Player() {
    x = width/2;
    size = 50;
    y =  height-size/2;
    coolDown = 0;
    coolDownRate = 15;
    bulletRate = 2;
  }

  void show() {
    rectMode(CENTER);
    fill(255);
    noStroke();
    rect(x, y, size, size);
    
    // draw in coolDown level
    textAlign(LEFT);
    textSize(20);
    stroke(255);
    text(str(coolDown), 10, 20);
  }

  void update(float vel) {
    // change x pos
    x += vel;
    if (x < size/2) {
      x = size/2;
    } else if (x + size/2 > width) {
      x = width - size/2;
    }

    
  }
  
  void chargeWeapon(){
    // reduce coolDown
    if (coolDown > 0) {
      coolDown -= 1;
    }
  }
}
