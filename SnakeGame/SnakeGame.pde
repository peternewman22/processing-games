/*
Keep track of snake through an arraylist of points
 Progress snake by cycling through the points
 Question of efficiency
 KeyPress --> Go one step in the direction of the thing
 Fake Pixels
 Collision Detection?
 Get Faster Over Time
 Original Screen Resolution: 95x65
 
 */

int totalPoints;
int step;
int timing; //every n frames
Snake s;
PVector up, down, left, right;

void setup() {
  size(950, 650);
  step = 10;
  rectMode(CENTER);
  s = new Snake();
  timing = 20;
  printCoords();
  up = new PVector(0,-step);
  down = new PVector(0,step);
  left = new PVector(-step,0);
  right = new PVector(step,0);
}

void draw() {
  background(0);
  if (frameCount % timing == 0 ) {
    s.update();
    //printCoords();
  }
  s.show();
}

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        s.turn(up);
        //println("Turning up");
        break;
      case DOWN:
        s.turn(down);
        //println("Turning down");
        break;
      case LEFT:
        s.turn(left);
        //println("Turning left");
        break;
      case RIGHT:
        s.turn(right);
        //println("Turning right");
        break;
      default:
        break;
    }
  }
}

void printCoords(){
  for(int i = 0 ; i < s.body.size(); i++){
     PVector loc = s.body.get(i);
     //print("(" + loc.x + ", " + loc.y + ")");
  }
  print("\n");
}
