class Enemy extends Ship {
  int row;
  String type;
  int points;
  PImage[] sprites;
  int frame = 0;

  
  Enemy(int row_, float x_, float y_, String type_, PImage sprite1, PImage sprite2) {
    super();
    row = row_;
    pos.set(x_, y_);
    size = shipSize;
    type = type_;
    allocatePoints();
    sprites = new PImage[2];
    sprites[0] = sprite1;
    sprites[1] = sprite2;
  } 


  void allocatePoints() {
    switch(type) {
    case "Large":
      points = 10;
      break;
    case "Medium":
      points = 20;
      break;
    case "Small":
      points = 30;
      break;
    case "UFO":
      points = 50;
      break;
    }
  }

  void show() {
    if (!iAmDead) {
      rectMode(CENTER);
      fill(255);
      noStroke();
      rect(pos.x, pos.y, size, size);
      //imageMode(CENTER);
      //image(sprites[frame],pos.x, pos.y);
    }
  }
}
