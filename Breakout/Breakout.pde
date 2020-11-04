import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Malcolm Armstrong
//1-1B
//Oct. 27

//Breakout

//Minim Variables
Minim minim;
AudioPlayer bHit, pHit, wHit, win, lose, song;

//Colour Pallate
color[] palette = {#273533, #BA01FF, #00C5BC, #BDE13E, #E5C145, #F93D95};

//Gif Stuff
PImage[] gif;
int gifN;
int frame;

//Brick Arrays=======================================================
int[] x;
int[] y;
boolean[] hit;
int brickD;
int brickN;
int tempX, tempY;

//mode framework=====================================================
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//Paddle Variables===================================================
float paddleX, paddleY, paddleD;

//Paddle Control=====================================================
boolean leftkey, rightkey;

//Ball Variables=====================================================
float ballX, ballY, ballD, ballVX, ballVY;

//Gameplay Variables=================================================
int lives, score;


void setup() {
  size(1600, 1200);
  mode = INTRO;
  rectMode(CENTER);
  
  //importing sounds
  minim = new Minim(this);
  bHit = minim.loadFile("blip1.wav");
  pHit = minim.loadFile("blip2.wav");
  wHit = minim.loadFile("blip3.wav");
  win = minim.loadFile("win.wav");
  lose = minim.loadFile("failure.wav");
  song = minim.loadFile("intro.wav");

  //building arrays==================================================
  brickD = 100;
  brickN = 54;
  x = new int[brickN];
  y = new int[brickN];
  hit = new boolean[brickN];
  tempX = 150;
  tempY = 150;

  int i = 0;
  while (i < brickN) {
    hit[i] = false;
    x[i] = tempX;
    y[i] = tempY;
    tempX = tempX + 150;
    if (tempX > width - 100) {
      tempX = 150;
      tempY = tempY + 100;
    } else if (tempX == width - 100) {
      tempX = 225; 
      tempY = tempY + 100;
    }
    i++;
  }

  //initializing paddle==============================================
  paddleX = width/2;
  paddleY = height;
  paddleD = 200;

  //initializing ball================================================
  ballX = width/2;
  ballY = height - paddleD;
  ballD = 25;
  ballVX = 0;
  ballVY = -10;

  //initializing gameplay variables==================================
  lives = 3;
  score = 0;

  //loading gif
  gifN = 30;
  gif = new PImage[gifN];

  int g = 0;
  while (g < gifN) {
    gif[g] = loadImage("frame_" + g + "_delay-0.13s.gif");
    g++;
  }
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
  } else {
    println("ERROR: mode = " + mode);
  }
}
