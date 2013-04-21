class Enemy{
  float ec;
  float expos;
  float eypos;
  float w = 20;
  float h = 20;
  boolean isAlive;
  
  Enemy(float tempec, float tempex, float tempey, boolean alive){
    ec = tempec;
    expos = tempex;
    eypos = tempey;
    isAlive = alive;
  }
  
  void edisplay(){
    noStroke();
    fill(ec);
    rectMode(CENTER);
    rect(expos, eypos, w, h);
  }
}
