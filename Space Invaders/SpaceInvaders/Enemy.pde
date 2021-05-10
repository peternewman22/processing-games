class Enemy extends Player{
  
  Enemy(){
    super();
    x = width/2;
    size = 50;
    y = 0;
    coolDown = 0;
    coolDownRate = 15;
    bulletRate = 2;
  }
}
