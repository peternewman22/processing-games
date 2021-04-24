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
BonusFruit bf;
int standardPoints, bonusPoints;
boolean hasTurned;
boolean gameOver;
int gameOverFrame;

void setup() {
  size(950, 650);
  step = 10;
  rectMode(CENTER);
  up = new PVector(0, -step);
  down = new PVector(0, step);
  left = new PVector(-step, 0);
  right = new PVector(step, 0);
  s = new Snake();
  gameOver = false;
  gameOverFrame = 0;
  timing = 10;
  printCoords();
  hasTurned = false;

  f = new Fruit();
  bf = new BonusFruit();
}

void draw() {
  background(0);
  if(!gameOver){
  if (frameCount % timing == 0 ) {
    s.update();
    resurrectBonus();
    //printCoords();
  }
  s.show(color(255));
  f.show();
  bf.show();
  showOverlay();
  } else {
    gameOverSequence();
  }
}

void gameOverSequence(){
  // the snake should flash
  float a = 0;
  float alpha = map(cos(a), -1, 1, 0, 255);
  s.show(color(255,alpha));
  if(frameCount - gameOverFrame > 60*3){
    noLoop();
  }
  
}

void resurrectBonus() {
  if (bf.expired) { // immediately generate a new bf but don't immediately activate it
    bf = new BonusFruit();
  }
  if (!bf.active && random(100) < 1) { //1% chance
    bf.active = true;
  }
}

void keyPressed() {
  // you can change directions faster than the snake updates
  // a workaround is using a flag to register if the move has been implemented
  if (hasTurned) {
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
    hasTurned = false;
  }
}

void showScore() {
  textAlign(LEFT);
  textSize(20);
  text("Score: " + str(playerScore), 20, 20);
}

void showOverlay() {
  stroke(255, 100);
  fill(255, 100);
  showScore();
  textAlign(CENTER);
  text("Head coordinates: ("+str(s.body.get(0).x) + ", " + str(s.body.get(0).y) + ")", width/2, height*0.85);
  text("Fruit coordinates: (" +str(f.loc.x) + ", " + str(f.loc.y) + ")", width/2, height*0.9);
  text("Bonus Fruit coordinates: (" +str(bf.loc.x) + ", " + str(bf.loc.y) + "). Life: " + str(bf.life), width/2, height*0.95);
}


void printCoords() {
  for (int i = 0; i < s.body.size(); i++) {
    PVector loc = s.body.get(i);
    print("(" + loc.x + ", " + loc.y + ")");
  }
  print("\n");
}
