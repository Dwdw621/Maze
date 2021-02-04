class Snowflake extends GameObject {
  float x, y, z, size, speed;

  Snowflake() {
    x = random(-2000, 4000);
    y = 0; 
    z = random(-2000, 2000);
    size = random(3, 10);
    speed = size;
  }

  void act() {
    y = y + speed;
    if (y > height) {
      y = 0;
      x = random(-2000, 4000);
      z = random(-2000, 2000);
    }
  }

  void show() {
    world.pushMatrix();
    world.fill(255, 150);
    world.translate(x, y, z);
    world.box(size);
    world.popMatrix();
  }
}
