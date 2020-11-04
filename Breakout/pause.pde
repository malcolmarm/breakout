void pause() {
  background(#EEFFEE);
  textAlign(CENTER, CENTER);
  textSize(200);
  fill(palette[0]);
  text("PAUSED", width/2, height/2);
}

void pauseClicks() {
  mode = GAME;
}
