class enemy extends GameObject {
  int x, z, btimer, l;
  color c;

  enemy(int x, int z, color c, int l) {
    lives = l;
    this.x = x;
    this.z = z;
    this.c = c;
    btimer = 0;
  }

  void show() {
    world.pushMatrix();
    world.fill(c);
    world.translate(x, 9.25*height/9.75, z);
    world.rotateY(-leftRightAngle);
    world.box(70, 200, 70);
    world.popMatrix();
  }

  void act() {
    btimer++;
    if (btimer > 35) {
      objects.add(new enemyBullet(x, z, eyex - x, eyez - z));
      btimer = 0;
    }

    if (eyex > 2000) lives = 0;

    int i = 0;
    while (i < objects.size()) {
      GameObject myObj = objects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.loc.x, myObj.loc.y, myObj.loc.z, x, 9.25*height/9.75, z) <= 60) {
          myObj.lives = 0;
          lives--;
        }
      }
      i++;
    }
  }
}
