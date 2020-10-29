//Malcolm Armstrong
//1-1B
//Oct. 27

//Breakout

//Brick Arrays
int[] x;
int[] y;
int brickD;

//mode framework
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//Paddle Variables
float paddleX, paddleY, paddleD;

//Paddle Control
boolean leftkey, rightkey;

//Ball Variables
float ballX, ballY, ballD, ballVX, ballVY;

//Gameplay Variables
int lives;


void setup() {
  size(1000, 1000);
  mode = GAME;
  rectMode(CENTER);
  
  //building arrays
  brickD = 50;
  x = new int[3];
  y = new int[3];
  
  x[0] = 100;
  y[0] = 100;
  
  x[1] = 400;
  x[1] = 100;
  
  x[2] = 700;
  y[2] = 100;
  
  //initializing paddle
  paddleX = width/2;
  paddleY = height;
  paddleD = 150;
  
  //initializing ball
  ballX = width/2;
  ballY = height/2;
  ballD = 15;
  ballVX = 3;
  ballVY = 5;
  
  //initializing gameplay variables
  lives = 3;
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
