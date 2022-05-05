class Animations {
  int frame = 1;
  int maxFrames = 20;
  float scale = 1;
  int mouseXPos = 200;
  int mouseYPos = 200;
  void Star(float scale, int xPos, int yPos) {
    xPos = xPos - int(scale * 100);
    yPos = yPos - int(scale *  90);
    //top
    line(100 * scale + xPos,0 * scale + yPos,130 * scale + xPos,70 * scale + yPos);
    line(100 * scale + xPos,0 * scale + yPos,70 * scale + xPos,70 * scale + yPos);
    
    //sides
    line(130 * scale + xPos,70 * scale + yPos,200 * scale + xPos,70 * scale + yPos);
    line(70 * scale + xPos,70 * scale + yPos,0 * scale + xPos,70 * scale + yPos);
    line(200 * scale + xPos,70 * scale + yPos,130 * scale + xPos,100 * scale + yPos);
    line(0 * scale + xPos,70 * scale + yPos,70 * scale + xPos,100 * scale + yPos);
    
    //legs
    line(160 * scale + xPos,170 * scale + yPos,130 * scale + xPos,100 * scale + yPos);
    line(40 * scale + xPos,170 * scale + yPos,70 * scale + xPos,100 * scale + yPos);
    line(160 * scale + xPos,170 * scale + yPos,100 * scale + xPos,120 * scale + yPos);
    line(40 * scale + xPos,170 * scale + yPos,100 * scale + xPos,120 * scale + yPos);
  }
  void Animate() {
    scale -= .1;
    stroke(random(1,255),random(1,255),random(1,255));
    Star(scale, mouseXPos, mouseYPos);
    if (frame == maxFrames) {
      frame = 1;
    }
    frame++;
    scale = .3;
  }
  void Render(float scales, int X, int Y) {
    scale = scales;
    mouseXPos = X;
    mouseYPos = Y;
    Animate();
  }
}
