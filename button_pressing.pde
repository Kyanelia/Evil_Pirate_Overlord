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

