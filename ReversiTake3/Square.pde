class Square{
  // squares have 3 states: neutral (0), player 1 (1), player 2 (2)
  int state = 0;
  int row, col;
  Square(int row_, int col_){
    row = row_;
    col = col_;
  }
  
  void switchState(){
    if(state == 1){
      state = 2;
    } else {
      state = 1;
    }
  }
  
  void show(){
    noStroke();
    switch(state){
      case 1:
        fill(255,0,0);
        ellipse((col+0.5)*res, (row+0.5)*res, res*ps, res*ps);
        break;
      case 2:
        fill(0,255,0);
        ellipse((col+0.5)*res, (row+0.5)*res, res*ps, res*ps);
        break;
      default:
        break;
    }
  }
}
