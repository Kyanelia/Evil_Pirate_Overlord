
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
}

void draw() {
  background(0);
  if(!bStarted)
  {
    showWelcomeScreen();
    return;
  }
  if(!bLevel1)
  {
    level1.level1_screen();
    return;
  }
  if(!wonLevel1&&!lostLevel1)
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
    level1.collided();  
    wonLevel1 = level1.won1();
    lostLevel1 = level1.lost1();
    return;
  }
  if(wonLevel1) level1.winScreen1();
  if(lostLevel1){
    level1.lostScreen1();
    wonLevel1 = false;
    level1.player.setupCanons();
    level1.e1_setup();
  }
}




