void gameover() {
  background(#EEFFEE);  
  textAlign(CENTER, CENTER);
  fill(palette[2]);
  textSize(150);
  if (score < brickN) {
    text("You Lose", width/2, height/2);
    lose.rewind();
    lose.play();
  }
  if (score == brickN) {
    text("You Win", width/2, height/2);
    win.rewind();
    win.play();
  }
}

void gameoverClicks() {
  lives = 3;
  score = 0;
  paddleX = width/2;
  ballX = paddleX;
  ballY = height - paddleD/2;
  ballVX = 0;
  ballVY = -6;
  int i = 0;
  while (i < brickN) {
    hit[i] = false;
    i++;
  }
  mode = INTRO;
}
