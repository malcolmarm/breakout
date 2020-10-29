void game() {
  background(255);

  textAlign(CENTER, CENTER);
  textSize(100);
  fill(#0000AA);
  text("Lives = " + lives, width/2, 100);


  //paddle
  fill(#AAAAFF);
  strokeWeight(1);
  circle(paddleX, paddleY, paddleD);

  //paddle control
  if (rightkey == true) paddleX = paddleX + 8;
  if (leftkey == true) paddleX = paddleX - 8;
  
  //paddle limits
  if (paddleX < 0 + paddleD/2) paddleX = 0 + paddleD/2;
  if (paddleX > width - paddleD/2) paddleX = width - paddleD/2;

  //ball
  fill(#0000FF);
  circle(ballX, ballY, ballD);
  ballX = ballX + ballVX;
  ballY = ballY + ballVY;
  if (ballX >= width - ballD/2 || ballX <= 0 + ballD/2) ballVX = ballVX * -1;
  if (ballY <= 0 + ballD/2) ballVY = ballVY * -1;
  if (ballY >= height - ballD/2) {
    lives = lives - 1;
    ballX = width/2;
    ballY = height/2;
    ballVX = 3;
    ballVY = 5;
  }

  if (dist(paddleX, paddleY, ballX, ballY) <= ballD/2 + paddleD/2) {
    ballVX = (ballX - paddleX)/6;
    ballVY = (ballY - paddleY)/6;
  }

  if (lives <= 0) mode = GAMEOVER;
}
