float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz, leftRightAngle, topBotAngle, HBar, BossHBar, TimeCheck;
int Btimer, mode, Timer, TeleT, IntroT;
boolean w, a, s, d, r, f, p, l, o;

//###Robot ##########
import java.awt.Robot;
Robot rbt;

//########## Map Stuff ##########
color black = #000000; //Bricks
color white = #FFFFFF; //empty space
color grey =  #7f7f7f; //WSB
color red =  #e10000; //Boss
int gridSize;
PImage map; 

//########## Game objects ##########
ArrayList<GameObject> objects;

//########## Canvases ##########
PGraphics world;
PGraphics HUD;

//########## Modes ##########
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WIN = 4;

//########## Textures ##########
PImage Bricks;
PImage Planks;
PImage MSB;

void setup() {
  mode = 0;

  //########## Initial Settings ##########
  eyex = 3000;  //-1800
  eyey = 9.25*height/12; //remember to change to 11
  eyez = 1900;   //1800
  focusx = 3050;
  focusy = 9.25*height/11;
  focusz = 1050;
  upx = 0;
  upy = 1;
  upz = 0;  
  gridSize = 100;
  IntroT = 0;

  //########## Other ##########
  size(displayWidth, displayHeight, P2D);
  objects = new ArrayList<GameObject>();
  frameRate(60);

  int z = 0;
  while (z < 200) {
    objects.add(new Snowflake());
    z = z + 1;
  }

  //########## Images ##########
  map = loadImage("map2.png");
  Bricks = loadImage("Bricks.png");
  Planks = loadImage("Planks.png");
  MSB = loadImage("MSB.png");

  //########## Robot ##########
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }

  BossHBar = width - width/4;
  HBar = width - width/4;
  //########## GFX Engine ##########  
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == WIN) {
    win();
  }
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == WIN) {
    winClicks();
  }
}
