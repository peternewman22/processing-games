class BonusFruit extends Fruit {
  // this fruit appears but only for a limited time
  // one its lifespan gets down to 20%, it should start to flash
  int life;
  float a;
  boolean expired;
  

  BonusFruit() {
    super(); //inherit fruit things
    life = 1000;
    points = 50;
    a = PI/2; //this way the flashing starts at on
    active = false;
    expired = false;
    name = "Bonus Fruit";
  }

  void show() {
    if (active) {
      noStroke();
      //get the alpha level
      if (life < 300) {
        float alpha = map(sin(a), -1, 1, 0, 255);
        fill(255, 0, 0, alpha);
        a += 0.1;
      } else {
        fill(255, 0, 0);
      }
      ellipse(loc.x, loc.y, 10, 10);   
      life -= 1; // every time it shows, decrease the lifespan
    }
    checkExpiry();
    
  }
  
  void checkExpiry(){
    if(life <= 0){
      active = false;
      expired = true;
    }
  }

  
}
