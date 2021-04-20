class Snake {
  ArrayList<PVector> body;
  PVector heading;

  Snake() {
    body = new ArrayList<PVector>();
    heading = left.copy();
    initSnake();
    
  }

  void initSnake() {
    // makes 5 segments, starting from the middle of the screen and heading right
    for (int i = 0; i < 5; i++) {
      body.add(new PVector(width/2 - 5 + i*step, height/2 - 5));
    }
  }

  void update(){
    // update each location to the one ahead of it, going backwards through the list 
    for(int i = body.size()-1; i > 0; i--){
      body.get(i).set(body.get(i-1));
    }   
    
    // add heading to the head of the snake
    body.get(0).add(heading);
    eatFruit();
    wrap(); // if it reaches the boundary, wrap
    
    
    
  
  }
  
  void wrap(){
    PVector head = body.get(0);
    if(head.x < 0){
      body.get(0).x = width;
    } else if(head.x > width){
      body.get(0).x = 0;
    } else if(head.y < 0){
      body.get(0).y = height;
    } else if(head.y > height){
      body.get(0).y = 0;
    }
  }
  
  void eatFruit(){
    // compare the fruit location with the head of the snake
    if(body.get(0).equals(f.loc)){
      playerScore += standardPoints; //get points
      PVector newSegment = f.loc.copy(); // note the location
      f.generateFruit();
      body.add(newSegment);
      
    }
  }
  
  void turn(PVector dir){
    heading.set(dir);
  }
  
  void show(){
    fill(255);
    noStroke();
    for (PVector loc : body){
      rect(loc.x, loc.y, step, step);
    }
  }
}
