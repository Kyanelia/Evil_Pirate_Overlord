class Enemy{
  float expos;
  float eypos;
  float ew = 20;
  float eh = 20;
  boolean isAlive;
  PImage alien1 = loadImage("alien1.png");
  
  Enemy(float tempex, float tempey, boolean alive){
    expos = tempex;
    eypos = tempey;
    isAlive = alive;
  }
  
  void edisplay(){
    if(isAlive){
      image(alien1, expos, eypos);
    }
  }
}
