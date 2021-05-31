Player p;
ArrayList<Bullet> bullets;
ArrayList<Explosion> explosions;
Enemy[] enemies;
int numEnemies = 55;
int colCount = 11;
int shipSize = 50;
float gap;
PImage spritesheet;
PImage[] allSprites;
boolean testMode = false;

void setup() {
  size(1500, 1000);
  gap = (width-11*shipSize)/(colCount+2);
  loadSprites();
  p = new Player(allSprites[0]);
  bullets = new ArrayList<Bullet>();
  explosions = new ArrayList<Explosion>();
  enemies = new Enemy[numEnemies];
  initEnemies();
}

void loadSprites(){
    spritesheet = loadImage("spritesheet.png");
    allSprites = new PImage[9];
    allSprites[0] = spritesheet.get(355, 1163, 104, 64); // player sprite
    allSprites[1] = spritesheet.get(364,689,96,64); // Large Sprite 1
    allSprites[2] = spritesheet.get(488,689,96,64); // Large Sprite 2
    allSprites[3] = spritesheet.get(488,689,88,64); // Medium Sprite 1
    allSprites[4] = spritesheet.get(491,689,88,64); // Medium Sprite 2
    allSprites[5] = spritesheet.get(400,478,64,64); // Small Sprite 1
    allSprites[6] = spritesheet.get(502,478,64,64); // Small Sprite 1
    allSprites[7] = spritesheet.get(390,785,192,84); // UFO
    allSprites[8] = spritesheet.get(402,965,176,128); // barrier
    
    //resizing
    //allSprites[0].resize(shipSize,0);
    //allSprites[1].resize(shipSize,0);
    //allSprites[2].resize(shipSize,0);
    //allSprites[3].resize(int(shipSize*0.8),0);
    //allSprites[4].resize(int(shipSize*0.8),0);
    //allSprites[5].resize(int(shipSize*0.6),0);
    //allSprites[5].resize(int(shipSize*0.6),0);
    //allSprites[6].resize(shipSize,0);
    
}

void initEnemies() {
  float currentX = 2*gap + shipSize/2;
  int currentCol = 0;
  for (int e = 0; e < numEnemies; e++) {
    int row = int(e/colCount);
    //println("row:" + row + " currnetCol:"+currentCol + " currentX:"+currentX + "row*size:"+row*size);
    if (row == 0) {
      enemies[e] = new Enemy(row, currentX, row*(shipSize+gap)+shipSize, "Small",allSprites[5],allSprites[6]);
    } else if (row == 1 || row == 2){
      enemies[e] = new Enemy(row, currentX, row*(shipSize+gap)+shipSize, "Medium",allSprites[3],allSprites[4]);
    } else {
      enemies[e] = new Enemy(row, currentX, row*(shipSize+gap)+shipSize, "Large",allSprites[1],allSprites[2]);
    }
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
  for (Explosion e : explosions) {
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
  
  //show overlay for testmode
  if(testMode){
    // diplay mousepos
    textAlign(LEFT);
    stroke(255);
    fill(255);
    textSize(20);
    text("( " + str(mouseX) + ", " + str(mouseY) + ")", mouseX, mouseY);
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
      bullets.add(new Bullet(p.pos.x, height - shipSize-20, -p.bulletRate));
      p.coolDown = 10;
    }
    break;
  case 't':
    testMode = !testMode;
  }
}

// to test out the explosion thing
void mousePressed() {
  if (testMode && mouseButton == LEFT) {
    explosions.add(new Explosion(mouseX, mouseY));
  }
}
