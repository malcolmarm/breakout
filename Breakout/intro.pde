void intro() {
  song.play();
  image(gif[frame], 0, 0, width, height);
  frame++;
  if (frame >= gifN) frame = 0;
  textAlign(CENTER, CENTER);
  fill(palette[0]);
  textSize(200);
  text("BREAKOUT", width/2, height/4);
  textSize(100);
  text("CLICK TO START!", width/2, height/4*3);
}

void introClicks() {
  mode = GAME;
}
