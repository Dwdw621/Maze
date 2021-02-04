void game() {
  noCursor();
  world.beginDraw();
  world.textureMode(NORMAL);

  world.background(50);
  world.pointLight(255, 255, 255, eyex, eyey, eyez);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  move();
  drawMap();
  Btimer++;

  world.pushMatrix();
  world.translate(1218, 9.25*height/10, 1700);
  world.fill(0, 255, 0, 50);
  world.box(400);
  world.popMatrix();

  //########## Draw floor ##########
  drawFloor(height, gridSize);

  //########## Objects ##########
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

  if (mousePressed == true && Btimer > 10) {
    objects.add(new Bullet());
    Btimer = 0;
  }

  world.endDraw();
  image(world, 0, 0);



  //########## Modes ##########
  if (HBar <= 0) {
    mode = GAMEOVER;
  }

  if (BossHBar <= 0) {
    mode = WIN;
  }


  if (p == true) {
    mode = PAUSE;
  }

  if (l == true) {
    BossHBar = 0;
  }

  if (o == true) {
    eyex = 1200;
    eyez = 1000;
  }

  //########## Teleport ##########
  if (eyex > 1014 && eyex< 1416 && eyez > 1495) {
    TeleT++;
    if (TeleT > 60) {
      eyex = 2400;
      eyez = 1800;
      objects.add(new boss(3050, 1050, red, 40));
    }
  } else {
    TeleT = 0;
  }

  //########## HUD ##########
  HUD.beginDraw();
  HUD.clear();
  Crosshair();
  Minimap();
  HBar();
  if (eyex>2000) BossHBar();
  HUD.endDraw();
  image(HUD, 0, 0);
}
