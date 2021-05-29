class Enemy extends Player {
  int row;
  Enemy(int row_, float x_, float y_) {
    super();
    row = row_;
    pos.x = x_;
    size = shipSize;
    pos.y = y_;
    coolDown = 0;
    coolDownRate = 15;
    bulletRate = 2;
  }
  
   void show() {
    if(!iAmDead){
       rectMode(CENTER);
      fill(255);
      noStroke();
      rect(pos.x, pos.y, size, size);
    }

  }
}
