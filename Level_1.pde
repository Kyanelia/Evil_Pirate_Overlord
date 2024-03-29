class Level_1{
  Enemy[][] enemies;
  Ship player = new Ship(width/2, 20);
  PImage back = loadImage("background.png");
  
  Level_1(){
    enemies = new Enemy[5][4];
  }
  //initial enemy setup
  //4 rows of 5 for level1
  void e1_setup(){
    for(int i=0;i<5;i++){
      for(int j=3;j>=0;j--){
        enemies[i][j] = new Enemy((i+3)*60, (j+9)*60, true);
        enemies[i][j].edisplay();
      }
    }
  }
  
  //level1 moves straight up screen
  void e1_move(){
    for(int i=0; i<5; i++){
      for(int j=0;j<4; j++){
        enemies[i][j].eypos-=0.5;
        enemies[i][j].edisplay();
      }
    }
  }
  
  //test collisions
  void collide1(){
    for(int i=0;i<cballs;i++){
      for(int j=0;j<5; j++){
        for(int k=0; k<4; k++){
          if(player.canon[i].cxpos+2 > enemies[j][k].expos
             && player.canon[i].cxpos-2 < enemies[j][k].expos+enemies[j][k].ew
             && player.canon[i].cypos+2 > enemies[j][k].eypos
             && player.canon[i].cypos-2 < enemies[j][k].eypos+enemies[j][k].eh
             && enemies[j][k].isAlive){
               enemies[j][k].isAlive = false;
               player.canon[i].fired = false;
               player.canon[i].cypos = -10;
             }
        }
      }
    }
  }
  
  //check if any aliens are still alive
  boolean won1(){
    for(int i=0; i<5; i++){
      for(int j=0; j<4; j++){
        if(enemies[i][j].isAlive == true){
          return false;
        }
      }
    }
    return true;
  }
  
  //check if lost 
  boolean lost1(){
    for(int i=0;i<5;i++){
      for(int j=0;j<4;j++){
        if(enemies[i][j].isAlive == true && enemies[i][j].eypos <=0){
          return true;
        }
        if(((player.xpos < (enemies[i][j].expos+enemies[i][j].ew) && (player.xpos+player.w > enemies[i][j].expos))
             || (((player.xpos+player.w) > enemies[i][j].expos) && (player.xpos < enemies[i][j].expos+enemies[i][j].ew)))
             && player.ypos+player.h > enemies[i][j].eypos
             && enemies[i][j].isAlive)
        {
             return true;
        }
      }
    }
    return false;
  }
 
  void level1_screen(){
    // Title
    textAlign(CENTER, CENTER);
    textSize(48);
    fill(#FF0000);
    text("Level 1", width / 2, height / 4);
   
    // Play button
    fill(#FF0000);
  //  stroke(#AAAA55);
    rectMode(CENTER);
    rect((float)playButtonX, height/2, (float)playButtonWidth+40.0, (float)playButtonHeight, 10.0);
    fill(0);
    textSize(32);
    text("READY?", width / 2,  height / 2);
  }
  
  boolean level1_start()
  {
  // Half-wdith
  int hw = playButtonWidth+40 / 2;
  // Half-height
  int hh = playButtonHeight / 2;
  // Returns true if mouse position is within the bounds of the button
  return mouseX >= playButtonX - hw && mouseX <= playButtonX + hw &&
      mouseY >= (height/2) - hh && mouseY <= (height/2) + hh;
  }
  
  void winScreen1(){
     // Title
    textAlign(CENTER, CENTER);
    textSize(48);
    fill(#FF0000);
    text("Level 1", width / 2, height / 4);
    text("CLEARED", width/2, height/2);
    //button
    rectMode(CENTER);
    rect((float)playButtonX, (float)playButtonY, (float)playButtonWidth+40.0, (float)playButtonHeight, 10.0);
    fill(0);
    textSize(32);
    text("LEVEL 2", width / 2,  4*height / 5);
   
  }
 
   void lostScreen1(){
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
