class Lander{
  // lander has mass, thrust in 4 directions (in the early versions of the game)
  PImage sprite;
  PVector pos, vel, acc, grav;
  float m;
  
  Lander(){
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    grav = new PVector(0, gravStrength);
    m = 2;
    
    sprite = loadImage("lander3.png");
  }
  
  void applyForce(PVector f){
    acc.add(f.div(m));
  }
  
  void update(){
    applyForce(grav);
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
  }
  
  void show(){
    rectMode(CENTER);
    fill(255);
    rect(pos.x, pos.y, 20, 60);
    //image(sprite,pos.x, pos.y);
  }
  
}
