void button(int x, int y, int w, int h, int size, String label) {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    fill(155);
  } else {
    fill(200);
  }
  
  strokeWeight(3);
  stroke(0, 255);
  rectMode(CENTER);
  rect(x, y, w, h, 5);
  strokeWeight(2);

  textSize(100);
  fill(0);
  textAlign(CENTER);
  textSize(size);
  text(label, x, y+h/15);
}

boolean buttonPressed(int x, int y, int w, int h) {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2)
    return true;
  else
    return false;
}
