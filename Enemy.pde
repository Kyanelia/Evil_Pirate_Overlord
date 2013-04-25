class Enemy{
  float expos;
  float eypos;
  float ew = 20;
  float eh = 20;
  boolean isAlive;
  PImage alien;
//  PImage alien1 = loadImage("alien1.png");
  
  Enemy(PImage img,float tempex, float tempey, boolean alive){
    expos = tempex;
    eypos = tempey;
    isAlive = alive;
    alien = img;
  }
  
  void edisplay(){
    if(isAlive){
      image(alien, expos, eypos);
    }
  }
}
