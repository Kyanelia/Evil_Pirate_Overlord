class Level_1{
  Enemy[][] enemies;
  Ship player = new Ship(color(255,0,255),width/2, 20);
  
  Level_1(){
    enemies = new Enemy[5][4];
  }
  //initial enemy setup
  //4 rows of 5 for level1
  void e1_setup(){
    for(int i=0;i<5;i++){
      for(int j=3;j>=0;j--){
        enemies[i][j] = new Enemy(color(0,0,0), (i+3)*60, (j+12)*60, true);
        enemies[i][j].edisplay();
      }
    }
  }
  
  //level1 moves straight up screen
  void e1_move(){
    for(int i=0; i<5; i++){
      for(int j=0;j<4; j++){
        enemies[i][j].eypos-=1;
        enemies[i][j].edisplay();
      }
    }
  }
/*  
  //test collisions
  void collided(){
    for(
  
 */ 
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
}