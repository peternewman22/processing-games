class Fruit {
  PVector loc;

  Fruit() {
    loc = new PVector(0,0);
    generateFruit();
  }

  void show() {
    // for now, I'll just make it a not-filled-in square
    noFill();
    stroke(255);
    rect(loc.x, loc.y, step, step);
  }

  void generateFruit() {
    // making sure it sits on some multiple of 10
    loc.set(new PVector(int(random(width/step))*step,int(random(height/step))*step));
    println("Fruit is located at (" + str(loc.x) + ", " + str(loc.y) + ")");
  }

    
    

}
