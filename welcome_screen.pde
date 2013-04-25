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

void showEndScreen()
{
  // Title
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(#FF0000);
  text("YOU", width / 2, height / 4);
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(#FF0000);
  text("WON!", width / 2, (height/4)+60);
 
  // Play button
  fill(#FF0000);
//  stroke(#AAAA55);
  rectMode(CENTER);
  rect((float)playButtonX, (float)3*(height/4), (float)playButtonWidth, (float)playButtonHeight, 10.0);
  fill(0);
  textSize(32);
  text("AGAIN?", width/2, 3*(height / 4));
}
boolean isMouseOverAgain()
{
  // Half-wdith
  int hw = playButtonWidth / 2;
  // Half-height
  int hh = playButtonHeight / 2;
  // Returns true if mouse position is within the bounds of the button
  return mouseX >= playButtonX - hw && mouseX <= playButtonX + hw &&
      mouseY >= (3*(height/4)) - hh && mouseY <= (3*(height/4));
}
