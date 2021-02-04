class potion extends GameObject {
  int x, z;

  potion(int x, int z) {
    lives = 1;
    this.x = x;
    this.z = z;
  }

  void show() {
    world.pushMatrix();
    world.fill(0, 200, 0);
    world.translate(x, 9.25*height/9.5, z);
    world.box(30, 30, 30);
    world.popMatrix();
  }

  void act() {
    if (dist(x, z, eyex, eyez)< 50) {
      if (HBar <  width - width/4) {
        HBar += (width - width/4)/10;
        lives--;
      }
    }
  }
}
