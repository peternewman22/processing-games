class Enemy extends Player {
  int row;
  Enemy(int row_, float x_, float y_) {
    super();
    row = row_;
    x = x_;
    size = 50;
    y = y_;
    coolDown = 0;
    coolDownRate = 15;
    bulletRate = 2;
  }
}
