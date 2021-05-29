Player p;
ArrayList<Bullet> bullets;
Enemy[] enemies;
int numEnemies = 55;
int colCount = 11;
int shipSize=50;
float gap;

void setup() {
  size(750, 500);
  gap = (width-11*shipSize)/(colCount+2);
  p = new Player();
  bullets = new ArrayList<Bullet>();
  enemies = new Enemy[numEnemies];
  initEnemies();
  
}

void initEnemies() {
  float currentX = 2*gap + shipSize/2;
  int currentCol = 0;
  for (int e = 0; e < numEnemies; e++) {
    int row = int(e/colCount);
    //println("row:" + row + " currnetCol:"+currentCol + " currentX:"+currentX + "row*size:"+row*size);
    enemies[e] = new Enemy(row, currentX, row*(shipSize+gap)+shipSize);
    currentCol += 1;
    if (currentCol >= colCount) {
      currentCol = 0;
    }
    currentX = 2*gap + shipSize/2 + (shipSize+gap)*currentCol;
  }
}

void draw() {
  background(0);
  p.show();
  if (frameCount % p.coolDownRate == 0) {
    p.chargeWeapon();
  }


  //drawing enemies
  for (Enemy e : enemies) {
    e.show();
    // drawing bullets
  }
  for (Bullet b : bullets) {
    b.update();
    for (Enemy e : enemies) {
      if (!e.iAmDead) {
        if (e.iAmHit(b.pos.x, b.pos.y)) {
          e.explode();
          b.iAmDead = true;
        }
      }
    }

    b.show();
  }
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    if (b.iAmDead) {
      bullets.remove(i);
    }
  }
}

void keyPressed() {
  switch(key) {
  case 'j':
    p.update(-25);
    break;
  case 'k':
    p.update(25);
    break;
  case ' ':
    if (p.coolDown == 0) {
      bullets.add(new Bullet(p.pos.x, height - p.size, -p.bulletRate));
      p.coolDown = 10;
    }
    break;
  }
}
