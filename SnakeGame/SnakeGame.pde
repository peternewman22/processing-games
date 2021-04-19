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

void setup() {
  size(950, 650);
  step = 10;
  rectMode(CENTER);
  s = new Snake();
  timing = 20;
  printCoords();
}

void draw() {
  background(0);
  if (frameCount % timing == 0 ) {
    s.update();
    //printCoords();
  }
  s.show();
  
}

void printCoords(){
  for(int i = 0 ; i < s.body.size(); i++){
     PVector loc = s.body.get(i);
     //print("(" + loc.x + ", " + loc.y + ")");
  }
  print("\n");
}
