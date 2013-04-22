class Enemy{
  float ec;
  float expos;
  float eypos;
  float ew = 20;
  float eh = 20;
  boolean isAlive;
  PImage alien1 = loadImage("alien1.png");
  
  Enemy(float tempec, float tempex, float tempey, boolean alive){
    ec = tempec;
    expos = tempex;
    eypos = tempey;
    isAlive = alive;
  }
  
  void edisplay(){
    if(isAlive){
 /*     noStroke();
      fill(ec);
      rect(expos, eypos, ew, eh);*/
      image(alien1, expos, eypos);
    }
  }
}
