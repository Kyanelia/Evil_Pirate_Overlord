void setup() {
  size(sizex,sizey);
  frameRate(60);
  playButtonWidth = width / 4;
  playButtonHeight = height / 8;
  playButtonX = width / 2;
  playButtonY = 4 * height / 5;
  level1 = new Level_1();
  level1.player.setupCanons();
  level1.e1_setup();
  level2 = new Level_2();
  level2.player.setupCanons();
  level2.e2_setup();
}

void draw() {
  background(0);
  //welcome screen
  if(!bStarted)
  {
    showWelcomeScreen();
    return;
  }
  //level 1 screen
  if(!bLevel1)
  {
    level1.level1_screen();
    return;
  }
  //level 1
  if(bLevel1&&!wonLevel1&&!lostLevel1)
  {
    image(level1.back, 0, 0);
    level1.player.display();
    level1.player.move();
    level1.player.fire();
    for(int i=0;i<cballs;i++){
      if(level1.player.canon[i].fired == true){
        level1.player.canon[i].cdisplay();
        level1.player.canon[i].firing();
      }
    }
    level1.e1_move();
    level1.collide1();  
    wonLevel1 = level1.won1();
    lostLevel1 = level1.lost1();
    return;
  }
  //winning level 1
  if(bLevel1 && wonLevel1&&!bLevel2) {
    
 //   when more levels
    level1.winScreen1();
    return;
  }
  //losing level 1
  if(bLevel1 && lostLevel1){
    level1.lostScreen1();
    wonLevel1 = false;
    level1.player.setupCanons();
    level1.e1_setup();
  }

  //level 2
  if(bLevel2&&!wonLevel2&&!lostLevel2)
  {
    image(level1.back, 0, 0);
    level2.player.display();
    level2.player.move();
    level2.player.fire();
    for(int i=0;i<cballs;i++){
      if(level2.player.canon[i].fired == true){
        level2.player.canon[i].cdisplay();
        level2.player.canon[i].firing();
      }
    }
    level2.e2_move();
    level2.collide2();  
    wonLevel2 = level2.won2();
    wonGame = wonLevel2;
    lostLevel2 = level2.lost2();
    return;
  }
  //winning level 1
  if(wonLevel2&&!wonGame) {
    
 //   when more levels
//    level2.winScreen1();
  }
  //losing level 1
  if(lostLevel2){
    level2.lostScreen2();
    wonLevel2 = false;
    level2.player.setupCanons();
    level2.e2_setup();
  }
  
  //winning game
  if(wonGame){
    showEndScreen();
  }
  
}




