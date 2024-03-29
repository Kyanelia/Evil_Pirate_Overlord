class Canon{
  color cc = color(0);
  float cxpos;
  float cypos;
  float csize = 4;
  boolean fired;

  Canon(float tempcx, float tempcy, boolean tempf){
    cxpos = tempcx;
    cypos = tempcy;
    fired = tempf;
  }
  
  void cdisplay(){
    noStroke();
    fill(cc);
    ellipseMode(CENTER);
    ellipse(cxpos,cypos,csize,csize);
  }
  
  void firing(){
    if ((cypos <= height+csize)&&fired){
      cypos+=4;
    }
    else{
      fired = false;
    }
  }
  
}
