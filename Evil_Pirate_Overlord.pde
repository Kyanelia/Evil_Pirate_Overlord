int X_AXIS = 0;
int Y_AXIS = 1;
int playButtonWidth, playButtonHeight;
int playButtonX, playButtonY;
boolean bStarted, bLevel1;
boolean canonball = false;
boolean moveRight = false;
boolean moveLeft = false;
int cballs = 10;

Level_1 level1;

void setup() {
  size(600,500);
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
  
  background(0,0,255);
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
  /*
  if(player.fired == true){
    player.canon.cdisplay();
    player.canon.firing();
    if(player.canon.cypos > height){
      player.fired = false;
    }
  }
  */
  
}

void showWelcomeScreen()
{
  // Title
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(#FF0000);
  text("Evil", width / 2, height / 4);
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(#FF0000);
  text("Pirate", width / 2, (height/4)+60);
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(#FF0000);
  text("OverLord", width / 2, (height/4)+120);
 
  // Play button
  fill(#FF0000);
//  stroke(#AAAA55);
  rectMode(CENTER);
  rect((float)playButtonX, (float)playButtonY, (float)playButtonWidth, (float)playButtonHeight, 10.0);
  fill(0);
  textSize(32);
  text("PLAY", width / 2, 4 * height / 5);
}

boolean isMouseOverPlayButton()
{
  // Half-wdith
  int hw = playButtonWidth / 2;
  // Half-height
  int hh = playButtonHeight / 2;
  // Returns true if mouse position is within the bounds of the button
  return mouseX >= playButtonX - hw && mouseX <= playButtonX + hw &&
      mouseY >= playButtonY - hh && mouseY <= playButtonY + hh;
}

void mousePressed()
{
  if(!bStarted && isMouseOverPlayButton())
  {
    bStarted = true;
    return;
  }
  if(bStarted && level1.level1_start() && !bLevel1)
  {
    bLevel1 = true;
    return;
  }
}

 void keyPressed(){
   if(key == CODED){
     if(keyCode == RIGHT){
       moveRight = true;
     }
     if(keyCode == LEFT){
       moveLeft = true;
     }
   }
   if(key == 'c'){
     canonball = true;
   }
 }
 void keyReleased(){
   if(key == CODED){
     if(keyCode == RIGHT){
       moveRight = false;
     }
     if(keyCode == LEFT){
       moveLeft = false;
     }
   }
   if(key == 'c'){
     canonball = false;
   }
 }

