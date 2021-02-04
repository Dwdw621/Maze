class Particle extends GameObject {
  PVector vel;

  Particle(float x, float y, float z, float s) {    
    super(x, y, z, s);
    vel = new PVector(random(-10, 10), random(-10, 10), random(-10, 10));
    lives = 255;
  }

  void act() {
    if (lives <= 0) lives = 0;
    loc.add(vel);
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    lives-=10;
    world.fill(white, lives);
    world.noStroke();
    world.box(size);
    world.popMatrix();
  }
}
