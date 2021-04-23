/*
Keep track of snake through an arraylist of points
 Progress snake by cycling through the points
 Question of efficiency
 KeyPress --> Go one step in the direction of the thing
 Fake Pixels
 Collision Detection?
 Get Faster Over Time
 Original Screen Resolution: 95x65
 
 
 //bugs
 - Can double back
 */

int playerScore;
int step;
int timing; //every n frames
Snake s;
PVector up, down, left, right;
Fruit f;
int standardPoints, bonusPoints;

void setup() {
  size(950, 650);
  step = 10;
  rectMode(CENTER);
  up = new PVector(0, -step);
  down = new PVector(0, step);
  left = new PVector(-step, 0);
  right = new PVector(step, 0);
  s = new Snake();
  timing = 10;
  printCoords();
  
  f = new Fruit();
  standardPoints = 10;
  bonusPoints = 50;
}

void draw() {
  background(0);
  if (frameCount % timing == 0 ) {
    s.update();
    //printCoords();
  }
  s.show();
  f.show();
  showOverlay();
}

void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case UP:
      if (!s.heading.equals(down)) {
        s.turn(up);
      };
      //println("Turning up");
      break;
    case DOWN:
      if (!s.heading.equals(up)) {
        s.turn(down);
      };
      //println("Turning down");
      break;
    case LEFT:
      if (!s.heading.equals(right)) {
        s.turn(left);
      };
      //println("Turning left");
      break;
    case RIGHT:
      if (!s.heading.equals(left)) {
        s.turn(right);
      };
      //println("Turning right");
      break;
    default:
      break;
    }
  }
}

void showScore() {
  textAlign(LEFT);
  textSize(20);
  text("Score: " + str(playerScore), 20, 20);
}

void showOverlay() {
  stroke(255,100);
  fill(255,100);
  showScore();
  textAlign(CENTER);
  text("Head coordinates: ("+str(s.body.get(0).x) + ", " + str(s.body.get(0).y) + ")", width/2, height*0.9);
  text("Fruit coordinates: (" +str(f.loc.x) + ", " + str(f.loc.y) + ")", width/2, height*0.95);
}


void printCoords() {
  for (int i = 0; i < s.body.size(); i++) {
    PVector loc = s.body.get(i);
    print("(" + loc.x + ", " + loc.y + ")");
  }
  print("\n");
}
