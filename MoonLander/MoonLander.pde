Lander l;
float gravStrength = 0.1;
float thrust = 1.5*gravStrength;
PVector left = new PVector(-thrust, 0);
PVector right = new PVector(thrust, 0);
PVector up = new PVector(0, -thrust);
PVector down = new PVector(0, thrust);

void setup() {
  size(500, 750);
  imageMode(CENTER);
  l = new Lander();
}

void draw() {
  background(0);
  l.update();
  l.show();
}

void keyPressed(){
  if(keyCode == LEFT){
    l.applyForce(left);
  }
  if(keyCode == RIGHT){
    l.applyForce(right);
  }
  if(keyCode == UP){
    l.applyForce(up);
  }
  if(keyCode == DOWN){
    l.applyForce(down);
  }
}
