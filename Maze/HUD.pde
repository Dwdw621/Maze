void Crosshair() {
  HUD.stroke(white);
  HUD.strokeWeight(3);
  HUD.line(width/2-10, height/2, width/2+10, height/2);
  HUD.line(width/2, height/2-10, width/2, height/2+10);
}

void Minimap() {
  //HUD.image(map, 10, 10, 100, 100); //x2.5
  int miniX= int(eyex+2000)/gridSize;
  int miniY= int(eyez+2000)/gridSize;
  HUD.fill(255);
  HUD.text("X: " + miniX, 20, 50);
  HUD.text("Y: " + miniY, 20, 75);

  //HUD.strokeWeight(0);
  //HUD.noStroke();
  //HUD.fill(255, 0, 0);
  //HUD.rect(miniX*2.5+10, miniY*2.5+10, 5, 5);
}

void HBar() {
  HUD.stroke(0);
  HUD.strokeWeight(2);
  HUD.fill(200);
  HUD.rect(width/8, height- height/20, width - width/4, height/70);

  //Actual bar
  HUD.fill(0, 200, 0);
  HUD.rect(width/8, height- height/20, HBar, height/70);
}

void BossHBar() {
  HUD.stroke(0);
  HUD.strokeWeight(2);
  HUD.fill(200);
  HUD.rect(width/8, height/40, width - width/4, height/70);

  //Actual bar
  HUD.fill(200, 0, 0);
  HUD.rect(width/8, height/40, BossHBar, height/70);

  HUD.fill(255);
  HUD.text("BOSS HEALTH", width/2, height/20);
}
