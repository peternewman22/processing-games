class Snake {
  ArrayList<PVector> body;
  PVector heading;

  Snake() {
    body = new ArrayList<PVector>();
    initSnake();
    heading = new PVector(-step,0);
  }

  void initSnake() {
    // makes 5 segments, starting from the middle of the screen and heading right
    for (int i = 0; i < 5; i++) {
      body.add(new PVector(width/2 + i*step, height/2));
    }
  }

  void update(){
    // update each location to the one ahead of it, going backwards through the list 
    for(int i = body.size()-1; i > 0; i--){
      body.get(i).set(body.get(i-1));
    }
    
    // add heading to the head of the snake
    body.get(0).add(heading);
    
  
  }
  
  void turn(PVector dir){
    heading.set(dir);
  }
  
  void show(){
    for (PVector loc : body){
      rect(loc.x, loc.y, step, step);
    }
  }
}
