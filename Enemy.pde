class Enemy{
  float ec;
  float expos;
  float eypos;
  float ew = 20;
  float eh = 20;
  boolean isAlive;
  
  Enemy(float tempec, float tempex, float tempey, boolean alive){
    ec = tempec;
    expos = tempex;
    eypos = tempey;
    isAlive = alive;
  }
  
  void edisplay(){
    if(isAlive){
      noStroke();
      fill(ec);
      rectMode(CENTER);
      rect(expos, eypos, ew, eh);
    }
  }
}
