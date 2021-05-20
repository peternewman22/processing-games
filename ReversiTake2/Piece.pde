class Piece{
  // each piece has a player and a position
  boolean isPlayer1;
  PVector pos;
  Piece(boolean isPlayer1_, float column, float row){
    isPlayer1 = isPlayer1_;
    pos = new PVector(column*res, row*res);
  }
  


}
