class boss extends enemy {
  float bossdir;

  boss(int x, int z, color c, int l) {
    super(x, z, c, l);
  }

  void show() {
    world.pushMatrix();
    world.fill(c);
    world.translate(x, 9.25*height/9.75 + sin(bossdir)*9, z);
    world.sphere(50);
    world.popMatrix();
  }

  void act() {
    btimer++;
    if (btimer > 3) {
      bossdir+=0.4;
      objects.add(new enemyBullet(x, z, 1-sin(bossdir), 0+cos(bossdir))); //1D    1D
      objects.add(new enemyBullet(x, z, 1+sin(bossdir), 0-cos(bossdir))); //1U   -1U

      objects.add(new enemyBullet(x, z, -1+sin(bossdir), 0-cos(bossdir))); //-1U -1U
      objects.add(new enemyBullet(x, z, -1-sin(bossdir), 0+cos(bossdir))); //-1U  1

      btimer = 0;
    }

    int i =0;
    while (i < objects.size()) {
      GameObject myObj = objects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.loc.x, myObj.loc.y,myObj.loc.z, x, 9.25*height/9.75 + sin(bossdir)*9 ,z) <= 50) {
          BossHBar -= (width - width/4)/40;
          myObj.lives = 0;
          lives--;
        }
      }
      i++;
    }
  }
}
