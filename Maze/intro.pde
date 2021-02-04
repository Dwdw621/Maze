void intro() {
  cursor();
  IntroT+=2;
  if (IntroT < 900) {
    eyex+= 2;
  } else if (IntroT > 900 && IntroT < 2500) {
    eyez -=2;
  } else if (IntroT > 2500 && IntroT < 4000) {
    eyex -=2;
  } else if (IntroT > 4000 && IntroT < 5700) {
    eyez +=2;
  } else if (IntroT > 5700 && IntroT < 6500) {
    eyex +=2;
  } else if (IntroT > 6500) {
    IntroT = 0;
  }

  //########## Intro World ##########
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(50);
  world.pointLight(255, 255, 255, eyex, eyey, eyez);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  drawMap();
  world.pushMatrix();
  world.translate(1218, 9.25*height/10, 1700);
  world.fill(0, 255, 0, 50);
  world.box(400);
  world.popMatrix();
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives <= 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  drawFloor(height, gridSize);
  world.endDraw();
  image(world, 0, 0);

  fill(255);
  textAlign(CENTER); 
  textSize(60);
  text("THE MAZE", width/2, height/2 - height/6);

  button(width/2, height/2, width/10, width/20, 30, "START GAME");
  button(width/2, height/2+height/10, width/10, width/20, 30, "EXIT");
}


void introClicks() {
  if (buttonPressed(width/2, height/2, width/10, width/20)) {
    mode = GAME;
    leftRightAngle = 4.7;
    topBotAngle = 0;
    eyex = -1800;
    eyey = 9.25*height/10;
    eyez = 1800;
    upx = 0;
    upy = 1;
    upz = 0;  
    Btimer = 0;
    gridSize = 100;
    objects.add(new potion(150, 350));
    objects.add(new potion(150, 50));
    objects.add(new potion(-950, -50));
    objects.add(new potion(-550, -1250));
    objects.add(new potion(150, -500));
    objects.add(new potion(1250, -1250));

    objects.add(new enemy(-1750, -800, grey, 6));
    objects.add(new enemy(1800, 350, grey, 6));
    objects.add(new enemy(1750, -1350, grey, 6));
    objects.add(new enemy(1750, -1650, grey, 6));
    objects.add(new enemy(-700, 1750, grey, 6));
    objects.add(new enemy(-250, 1750, grey, 6));
    objects.add(new enemy(-250, -1650, grey, 6));
  }

  if (buttonPressed(width/2, height/2+height/10, width/10, width/20)) {
    exit();
  }
}
