class Level_2{
  Enemy[][] troop1;
  Enemy[][] troop2;
  boolean left1=false;
  boolean left2=true;
  Ship player = new Ship(width/2, 20);
  PImage back = loadImage("background.png");
  
  Level_2(){
    troop1 = new Enemy[5][4];
    troop2 = new Enemy[5][4];
  }
  //initial enemy setup
  //4 rows of 5 for level1
  void e2_setup(){
    for(int i=0;i<5;i++){
      for(int j=3;j>=0;j--){
        troop1[i][j] = new Enemy(i*60, (j+9)*60, true);
        troop1[i][j].edisplay();
      }
    }
  }
  
  //level2 moves diagonally back and forward up the screen
  void e2_move(){
    if(left1){
      for(int i=0; i<5; i++){
        for(int j=0;j<4; j++){
          troop1[i][j].eypos-=0.5;
          troop1[i][j].expos+=0.5;
          troop1[i][j].edisplay();
          if(troop1[i][j].expos+troop1[i][j].ew >= width&&troop1[i][j].isAlive) left1 = false;
        }
      }
    }
      else{
        for(int i=0; i<5; i++){
          for(int j=0;j<4; j++){
            troop1[i][j].eypos-=0.5;
            troop1[i][j].expos-=0.5;
            troop1[i][j].edisplay();
            if(troop1[i][j].expos+troop1[i][j].ew <= 0&&troop1[i][j].isAlive) left1 = true;
          }
        }
      }        
    
  }
  
  //test collisions
  void collide2(){
    for(int i=0;i<cballs;i++){
      for(int j=0;j<5; j++){
        for(int k=0; k<4; k++){
          if(player.canon[i].cxpos+2 > troop1[j][k].expos
             && player.canon[i].cxpos-2 < troop1[j][k].expos+troop1[j][k].ew
             && player.canon[i].cypos+2 > troop1[j][k].eypos
             && player.canon[i].cypos-2 < troop1[j][k].eypos+troop1[j][k].eh
             && troop1[j][k].isAlive){
               troop1[j][k].isAlive = false;
               player.canon[i].fired = false;
               player.canon[i].cypos = -10;
             }
        }
      }
    }
  }
  
  //check if any aliens are still alive
  boolean won2(){
    for(int i=0; i<5; i++){
      for(int j=0; j<4; j++){
        if(troop1[i][j].isAlive == true){
          return false;
        }
      }
    }
    return true;
  }
  
  //check if lost 
  boolean lost2(){
    for(int i=0;i<5;i++){
      for(int j=0;j<4;j++){
        if(troop1[i][j].isAlive == true && troop1[i][j].eypos <=0){
          return true;
        }
        if(((player.xpos < (troop1[i][j].expos+troop1[i][j].ew) && (player.xpos+player.w > troop1[i][j].expos))
             || (((player.xpos+player.w) > troop1[i][j].expos) && (player.xpos < troop1[i][j].expos+troop1[i][j].ew)))
             && player.ypos+player.h > troop1[i][j].eypos
             && troop1[i][j].isAlive)
        {
             return true;
        }
      }
    }
    return false;
  }
 
  void level2_screen(){
    // Title
    textAlign(CENTER, CENTER);
    textSize(48);
    fill(#FF0000);
    text("Level 2", width / 2, height / 4);
   
    // Play button
    fill(#FF0000);
  //  stroke(#AAAA55);
    rectMode(CENTER);
    rect((float)playButtonX, height/2, (float)playButtonWidth+40.0, (float)playButtonHeight, 10.0);
    fill(0);
    textSize(32);
    text("READY?", width / 2,  height / 2);
  }
  
  boolean level2_start()
  {
  // Half-wdith
  int hw = playButtonWidth+40 / 2;
  // Half-height
  int hh = playButtonHeight / 2;
  // Returns true if mouse position is within the bounds of the button
  return mouseX >= playButtonX - hw && mouseX <= playButtonX + hw &&
      mouseY >= (height/2) - hh && mouseY <= (height/2) + hh;
  }
  
  void winScreen2(){
     // Title
    textAlign(CENTER, CENTER);
    textSize(48);
    fill(#FF0000);
    text("Level 2", width / 2, height / 4);
    text("CLEARED", width/2, height/2);
   
  }
 
   void lostScreen2(){
     // Title
    textAlign(CENTER, CENTER);
    textSize(48);
    fill(#FF0000);
    text("You Lost", width / 2, height / 4);

     // Play button
    fill(#FF0000);
  //  stroke(#AAAA55);
    rectMode(CENTER);
    rect((float)playButtonX, (float)playButtonY, (float)playButtonWidth+40.0, (float)playButtonHeight, 10.0);
    fill(0);
    textSize(32);
    text("Retry?", width / 2,  4*height / 5);
  }   
}
