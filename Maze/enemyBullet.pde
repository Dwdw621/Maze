class enemyBullet extends GameObject {
  PVector dir;
  float speed;

  enemyBullet(float x, float z, float vx, float vz) {
    loc = new PVector(x, 9.25*height/9.7, z);
    dir = new PVector(vx, 0, vz);
    speed = 40;
    dir.setMag(speed);
  }

  void act() {
    int hitx = int(loc.x + 2000) / gridSize;
    int hity = int(loc.z + 2000) / gridSize;
    if (map.get(hitx, hity) == white) {
      loc.add(dir);
    } else {
      lives = 0;
      for (int i = 0; i < 5; i++) {
        objects.add(new Particle(loc.x, loc.y, loc.z, 5));
      }
    }
    if (dist(loc.x, loc.z, eyex, eyez) < 50) {
      lives = 0;
      HBar -= (width - width/4)/10;
    }
  }
}
