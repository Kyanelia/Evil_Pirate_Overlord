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
  if(lostLevel1 && isMouseOverPlayButton())
  {
    lostLevel1 = false;
    return;
  }
  if(wonLevel1 && isMouseOverPlayButton())
  {
    bLevel2 = true;
    return;
  }
    if(lostLevel2 && isMouseOverPlayButton())
  {
    lostLevel2 = false;
    return;
  }
/*  if(wonLevel2 && isMouseOverPlayButton())
  {
    bLevel1 = true;
    bLevel2 = false;
    return;
  }*/
  if(wonGame && isMouseOverAgain())
  {
    wonGame = false;
    wonLevel1 = false;
    bStarted = false;
    bLevel1 = false;
    level1.player.setupCanons();
    level1.e1_setup();
    wonLevel2 = false;
    bLevel2 = false;
    level2.player.setupCanons();
    level2.e2_setup();
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

