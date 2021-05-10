Player p;
ArrayList<Bullet> bullets;


void setup() {
  size(500, 750);
  p = new Player();
  bullets = new ArrayList<Bullet>();
}

void draw() {
  background(0);
  p.show();
  if(frameCount%p.coolDownRate == 0){
    p.chargeWeapon();
  }
  for (Bullet b : bullets) {
    b.update();
    b.show();
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
