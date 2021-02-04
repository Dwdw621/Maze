void move() {
  if (d && canRStrafe()) {
    eyex += cos(leftRightAngle + PI/2)*10;
    eyez += sin(leftRightAngle + PI/2)*10;
  }
  if (a && canLStrafe()) {
    eyex -= cos(leftRightAngle + PI/2)*10;
    eyez -= sin(leftRightAngle + PI/2)*10;
  }
  if (w && canForward() && canRight() && canLeft()) {
    eyex += cos(leftRightAngle)*10;
    eyez += sin(leftRightAngle)*10;
  }

  if (s && canBackward()) {
    eyex -= cos(leftRightAngle)*10;
    eyez -= sin(leftRightAngle)*10;
  }

  focusx = eyex + cos(leftRightAngle)*300;
  focusy = eyey + tan(topBotAngle)*300;
  focusz = eyez + sin(leftRightAngle)*300;

  //########## Mouse Controls ##########
  if (abs(pmouseX - mouseX) < width - 100) leftRightAngle -= (pmouseX - mouseX)*0.001;
  topBotAngle -= (pmouseY - mouseY)*0.001;

  if (pmouseX > displayWidth - 10) rbt.mouseMove(20, pmouseY);
  if (pmouseX < 10) rbt.mouseMove(displayWidth - 20, pmouseY);
}

void keyPressed() {
  if (key == 'd' || key == 'D') {
    d = true;
  }
  if (key == 'a' || key == 'A') {
    a = true;
  }
  if (key == 'w' || key == 'W') {
    w = true;
  }
  if (key == 's' || key == 'S') {
    s = true;
  }
  if (key == 'p' || key == 'P') {
    p = true;
  }
  if (key == 'l' || key == 'L') {
    l = true;
  }
  if (key == 'o' || key == 'O') {
    o = true;
  }
}

void keyReleased() {
  if (key == 'd' || key == 'D') {
    d = false;
  }
  if (key == 'a' || key == 'A') {
    a = false;
  }
  if (key == 'w' || key == 'W') {
    w = false;
  }
  if (key == 's' || key == 'S') {
    s = false;
  }
  if (key == 'p' || key == 'P') {
    p = false;
  }
  if (key == 'l' || key == 'L') {
    l = false;
  }
  if (key == 'o' || key == 'O') {
    o = false;
  }
} 

boolean canForward() {
  float fwdx, fwdz;
  int mapx, mapy;

  fwdx = eyex + cos(leftRightAngle)*150;
  fwdz = eyez + sin(leftRightAngle)*150;

  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canRight() {
  float rgtx, rgtz;
  int mapx, mapy;

  rgtx = eyex + cos(leftRightAngle + radians(10))*150;
  rgtz = eyez + sin(leftRightAngle + radians(10))*150;

  mapx = int(rgtx+2000) / gridSize;
  mapy = int(rgtz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canLeft() {
  float lftx, lftz;
  int mapx, mapy;

  lftx = eyex + cos(leftRightAngle - radians(10))*150;
  lftz = eyez + sin(leftRightAngle - radians(10))*150;

  mapx = int(lftx+2000) / gridSize;
  mapy = int(lftz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canLStrafe() {
  float lstfx, lstfz;
  int mapx, mapy;

  lstfx = eyex + cos(leftRightAngle - radians(90))*100;
  lstfz = eyez + sin(leftRightAngle - radians(90))*100;

  mapx = int(lstfx+2000) / gridSize;
  mapy = int(lstfz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canRStrafe() {
  float rstfx, rstfz;
  int mapx, mapy;

  rstfx = eyex + cos(leftRightAngle + radians(90))*100;
  rstfz = eyez + sin(leftRightAngle + radians(90))*100;

  mapx = int(rstfx+2000) / gridSize;
  mapy = int(rstfz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canBackward() {
  float bwdx, bwdz;
  int mapx, mapy;

  bwdx = eyex + cos(leftRightAngle + radians(180))*100;
  bwdz = eyez + sin(leftRightAngle + radians(180))*100;

  mapx = int(bwdx+2000) / gridSize;
  mapy = int(bwdz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
