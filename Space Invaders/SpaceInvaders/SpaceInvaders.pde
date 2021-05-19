Player p;
ArrayList<Bullet> bullets;
Enemy[] enemies;
int numEnemies = 55;
int gap = 10;
int numCol = 11;
//int size = (width - gap*(numCol+1))/numCol;

int size=50;

void setup() {
  size(750, 500);
  p = new Player();
  bullets = new ArrayList<Bullet>();
  enemies = new Enemy[numEnemies];
  initEnemies();
}

void initEnemies() {
  int currentX = 0;
  int currentCol = 0;
  for (int e = 0; e < numEnemies; e++) {
    
    int row = int(e/numCol);
   
      println("row:" + row + " currnetCol:"+currentCol + " currentX:"+currentX + "row*size:"+row*size);
    enemies[e] = new Enemy(row, currentX, row*(size+gap));
    
    currentCol += 1;
    if(currentCol >= numCol){
      currentCol = 0;
    }
    
      currentX = gap+(size+gap)*currentCol;
    
  }
}

void draw() {
  background(0);
  p.show();
  if (frameCount%p.coolDownRate == 0) {
    p.chargeWeapon();
  }
  // drawing bullets
  for (Bullet b : bullets) {
    b.update();
    b.show();
  }

  //drawing enemies
  for (Enemy e : enemies) {
    e.show();
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
      bullets.add(new Bullet(p.x, height-p.size, -p.bulletRate));
      p.coolDown = 10;
    }
    break;
  }
}
