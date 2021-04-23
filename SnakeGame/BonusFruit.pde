class BonusFruit extends Fruit {
  // this fruit appears but only for a limited time
  // one its lifespan gets down to 20%, it should start to flash
  int life;
  float a;
  

  BonusFruit() {
    super(); //inherit fruit things
    life = 20*60;
    a = PI/2; //this way the flashing starts at on
    active = false;
    name = "Bonus Fruit";
  }
  
  void checkIsActive(){
    if(!active){
      if(random(100) < 0.1){ // 5% chance that a bonus fruit randomly appears
        generateFruit(); // re-init
        active = true;
      }
    }
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
    }
  }

  
}
