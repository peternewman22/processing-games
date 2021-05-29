Player p;
ArrayList<Bullet> bullets;
ArrayList<Explosion> explosions;
Enemy[] enemies;
int numEnemies = 55;
int colCount = 11;
int shipSize = 50;
float gap;

void setup() {
  size(750, 500);
  gap = (width-11*shipSize)/(colCount+2);
  p = new Player();
  bullets = new ArrayList<Bullet>();
  explosions = new ArrayList<Explosion>();
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

  // show the player
  p.show();

  //charge the player's weapon
  if (frameCount % p.coolDownRate == 0) {
    p.chargeWeapon();
  }

  //draw enemies
  for (Enemy e : enemies) {
    e.show();
  }

  // draw bullets
  for (Bullet b : bullets) {
    b.update();
    // check to see if a bullet has hit an enemy
    for (Enemy e : enemies) {
      if (!e.iAmDead) { // don't do hit detection on dead enemies
        if (e.iAmHit(b.pos.x, b.pos.y)) { // check for hits
          //e.explode(); // explode!
          explosions.add(new Explosion(b.pos.x, b.pos.y));
          e.iAmDead = true;
          b.iAmDead = true;
        }
      }
    }
    b.show();
  }
  
  // showing explosions
  for(Explosion e: explosions){
    e.update();
    e.show();
  }
  
  // removing finished bullets
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    if (b.iAmDead) {
      bullets.remove(i);
    }
  }

  // removing finished explosions
  for (int i = explosions.size() - 1; i >= 0; i--) {
    Explosion e = explosions.get(i);
    if (e.isFinished) {
      explosions.remove(i);
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

// to test out the explosion thing
void mousePressed() {
  if (mouseButton == LEFT) {
    explosions.add(new Explosion(mouseX, mouseY));
  }
}
