class Player {
  // Player has an x position, show, fire, powerups
  //float x;
  //float y;
  float size;
  int coolDown;
  int coolDownRate;
  int bulletRate;
  boolean iAmDead;
  
  PVector pos;
  PVector vel;

  Player() {
    
    pos = new PVector(size/2,height - size);
    //vel = new PVector(0, vely);
    pos.x = width/2;
    size = 50;
    pos.y =  height - size/2;
    coolDown = 0;
    coolDownRate = 15;
    bulletRate = 2;
    iAmDead = false;
  }

  void show() {
    if(!iAmDead){
       rectMode(CENTER);
      fill(255);
      noStroke();
      rect(pos.x, pos.y, size, size);
    
      // draw in coolDown level
      textAlign(LEFT);
      textSize(20);
      stroke(255);
      text(str(coolDown), 10, 20);
    }

  }
  
  

  void update(float vel) {
    // change x pos
    pos.x += vel;
    if (pos.x < size/2) {
      pos.x = size/2;
    } else if (pos.x + size/2 > width) {
      pos.x = width - size/2;
    }

    
  }
  
  boolean iAmHit(float x_, float y_) {
    if(x_ >= pos.x - size/2 && x_ <= pos.x + size/2 && y_ >= pos.y - size/2 && y_ <= pos.y + size/2 ){
      return true;
    }
    return false;
  }
  
  void explode(){
    iAmDead = true;
    push();
    translate(pos.x, pos.y);
    for(int i = 0; i < 12; i++){
      rotate(PI/6);
        line(20,0,100,0);
    }
    pop();
  }
  
  void chargeWeapon(){
    // reduce coolDown
    if (coolDown > 0) {
      coolDown -= 1;
    }
  }
}
