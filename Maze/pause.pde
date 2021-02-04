void pause() {
  cursor();
  fill(255);
  textAlign(CENTER); 
  textSize(60);
  text("GAME PAUSED", width/2, height/2 - height/6);
  
  button(width/2, height/2, width/10, width/20, 30, "RESUME");
  button(width/2, height/2+height/10, width/10, width/20, 30, "MAIN MENU");
}

void pauseClicks() {
  if (buttonPressed(width/2, height/2, width/10, width/20)) {
    mode = GAME;
  }

  if (buttonPressed(width/2, height/2+height/10, width/10, width/20)) {
    mode = INTRO;
    setup();
  }
}
