void gameover() {
  cursor();
  fill(255);
  textAlign(CENTER); 
  textSize(60);
  text("GAME OVER", width/2, height/2 - height/6);

  button(width/2, height/2, width/10, width/20, 30, "MAIN MENU");
  button(width/2, height/2+height/10, width/10, width/20, 30, "EXIT");
}

void gameoverClicks() {
  if (buttonPressed(width/2, height/2, width/10, width/20)) {
    mode = INTRO;
    setup();
  }

  if (buttonPressed(width/2, height/2+height/10, width/10, width/20)) {
    exit();
  }
}
