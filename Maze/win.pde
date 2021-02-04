void win() {
  cursor();
  fill(255);
  textAlign(CENTER); 
  textSize(60);
  text("YOU WIN!", width/2, height/2 - height/6);
  button(width/2, height/2, width/10, width/20, 30, "MAIN MENU");
  button(width/2, height/2+height/10, width/10, width/20, 30, "EXIT");
}

void winClicks() {
  if (buttonPressed(width/2, height/2, width/10, width/20)) {
    mode = INTRO;
    setup();
  }

  if (buttonPressed(width/2, height/2+height/10, width/10, width/20)) {
    exit();
  }
}
