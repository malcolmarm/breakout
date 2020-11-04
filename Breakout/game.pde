void game() {
  background(#EEFFEE);

  //UI display
  textAlign(BOTTOM, LEFT);
  textSize(50);
  fill(#0000AA);
  text("Lives = " + lives, 25, height - 25);
  textAlign(RIGHT);
  text("Score = " + score, width - 25, height - 25);

  //paddle =======================================================================
  fill(palette[2]);
  strokeWeight(1);
  circle(paddleX, paddleY, paddleD);

  //paddle control================================================================
  if (rightkey == true) paddleX = paddleX + 15;
  if (leftkey == true) paddleX = paddleX - 15;

  //paddle limits=================================================================
  if (paddleX < 0 + paddleD) paddleX = 0 + paddleD;
  if (paddleX > width - paddleD) paddleX = width - paddleD;

  //ball==========================================================================
  fill(palette[2]);
  circle(ballX, ballY, ballD);
  ballX = ballX + ballVX;
  ballY = ballY + ballVY;

  //ball collision==============================================================
  if (ballX >= width - ballD/2) {
    ballVX = ballVX * -1;
    ballX = width - ballD/2;
  }
  if (ballX <= 0 + ballD/2) {
    ballVX = ballVX * -1;
    ballX = 0 + ballD/2;
  }
  if (ballY <= 0 + ballD/2) ballVY = ballVY * -1;
  if (ballY >= height - ballD/2) {
    lives = lives - 1;
    ballX = paddleX;
    ballY = height - paddleD/2 - 20;
    ballVX = 0;
    ballVY = -6;
  }

  //paddle bounce===============================================================
  if (dist(paddleX, paddleY, ballX, ballY) <= ballD/2 + paddleD/2) {
    ballVX = (ballX - paddleX)/10;
    ballVY = (ballY - paddleY)/10;
    pHit.rewind();
    pHit.play();
  }

  //bricks=======================================================================
  int i = 0;
  while (i < brickN) {
    if (hit[i] == false) {
      manageBricks(i);
    } 
    i++;
  } 

  //gameover=====================================================================
  if (lives <= 0 || score == brickN) mode = GAMEOVER;
}

void manageBricks(int i) {
  if (y[i] == 150) fill(palette[0]);
  if (y[i] == 250) fill(palette[1]);
  if (y[i] == 350) fill(palette[2]);
  if (y[i] == 450) fill(palette[3]);
  if (y[i] == 550) fill(palette[4]);
  if (y[i] == 650) fill(palette[5]);
  circle (x[i], y[i], brickD);
  if (dist(ballX, ballY, x[i], y[i]) <= brickD/2 + ballD/2) {
    ballVX = (ballX - x[i])/5;
    ballVY = (ballY - y[i])/5;
    hit[i] = true;
    bHit.rewind();
    bHit.play();
    score++;
  }
}

void gameClicks() {
  mode = PAUSE;
}
