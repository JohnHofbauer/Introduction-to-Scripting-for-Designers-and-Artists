
// Player image objects. 
PImage imgHead;
PImage imgBody;
PImage imgTailF1;
PImage imgTailF2;
PImage imgTailF3;
PImage imgBLFoot;
PImage imgFLFoot;
PImage imgBFFoot;
PImage imgFFFoot;

// pober ball image objects. 
PImage ballFrame;

// Player class.
class PlayerTwo {
  
  // Defines player verables
  int playerSpeed = 2;
  int PlayerXpos = 300; 
  int PlayerYpos = 10;
  int PlayerXCorrectionPos = -50; 
  int PlayerYCorrectionPos = -65;
  float PlayerScail = 50;  
  
  
  // Defines lazer verables
  int lazerXpos = 0;
  int lazerYpos = 0;
  int lazerXSpeed = 0;
  int lazerYSpeed = 0;
  boolean fireLazer = true;
  boolean setLazerSpeed = true;
  
  // Defines the frame verables.
  int maxFrames = 4;
  int currentFrame = 1;
  int maxFramesSkip = 10;
  int currentFrameSkip = 1;
  
  
  
  int[] Player() {
    // Controals player movenent with speed, only to get close to the mouse pointer not ontop.
    if (mouseX - 100 > PlayerXpos) { PlayerXpos += playerSpeed; }
    if (mouseX + 100 < PlayerXpos) { PlayerXpos -= playerSpeed; }
    if (mouseY - 100 > PlayerYpos) { PlayerYpos += playerSpeed; }
    if (mouseY + 100 < PlayerYpos) { PlayerYpos -= playerSpeed; }
    
    // Draws the player
    imgHead = loadImage("pixil-frame-0.png");
    imgBody = loadImage("pixil-frame-0 (1).png");
    imgFLFoot = loadImage("pixil-frame-0 (5).png");
    imgBFFoot = loadImage("pixil-frame-0 (7).png");
    imgFFFoot = loadImage("pixil-frame-0 (8).png");
    
    //Tail
    if (currentFrame == 1) { imgTailF1 = loadImage("pixil-frame-0 (3-1).png"); }
    if (currentFrame == 2 || currentFrame == 4) { imgTailF1 = loadImage("pixil-frame-0 (3).png"); }
    if (currentFrame == 3) { imgTailF1 = loadImage("pixil-frame-0 (3-3).png"); }
    
    //Back Left Foot
    if (currentFrame % 2 == 0) { imgBLFoot = loadImage("pixil-frame-0 (2).png"); }
    if (currentFrame % 2 == 1) { imgBLFoot = loadImage("pixil-frame-0 (2-2).png"); }
    
    //Draw the images in order
    image(imgBFFoot, PlayerXpos + 5 *(PlayerScail/100) + PlayerXCorrectionPos, PlayerYpos + 45 *(PlayerScail/100) + PlayerYCorrectionPos, PlayerScail, PlayerScail);
    image(imgFFFoot, PlayerXpos - 35 *(PlayerScail/100) + PlayerXCorrectionPos, PlayerYpos + 80 *(PlayerScail/100) + PlayerYCorrectionPos, PlayerScail, PlayerScail);
    
    image(imgTailF1, PlayerXpos - 75 *(PlayerScail/100) + PlayerXCorrectionPos, PlayerYpos + 40 *(PlayerScail/100) + PlayerYCorrectionPos, PlayerScail, PlayerScail);
    image(imgBody, PlayerXpos - 30 *(PlayerScail/100) + PlayerXCorrectionPos, PlayerYpos + 40 *(PlayerScail/100) + PlayerYCorrectionPos, PlayerScail, PlayerScail);
    image(imgHead, PlayerXpos + PlayerXCorrectionPos, PlayerYpos + PlayerYCorrectionPos, PlayerScail, PlayerScail);
    image(imgBLFoot, PlayerXpos - 45 *(PlayerScail/100) + PlayerXCorrectionPos, PlayerYpos + 75 *(PlayerScail/100) + PlayerYCorrectionPos, PlayerScail, PlayerScail);
    image(imgFLFoot, PlayerXpos + 15 *(PlayerScail/100) + PlayerXCorrectionPos, PlayerYpos + 65 *(PlayerScail/100) + PlayerYCorrectionPos, PlayerScail * .6, PlayerScail * .6);
    
    if (currentFrameSkip > maxFramesSkip) { currentFrameSkip = 1; }
    if (currentFrame < maxFrames && maxFramesSkip == currentFrameSkip) { currentFrame++; }
    else if (currentFrame == maxFrames  && maxFramesSkip == currentFrameSkip) { currentFrame = 1; }
    //println("The current Frame is: " + currentFrame);
    currentFrameSkip++;
    
    // Fire the LAZER
    if (fireLazer == true) {
      
      //set the frame for the power ball
      if (currentFrame == 1) { ballFrame = loadImage("ball1.png"); }
      if (currentFrame == 2 || currentFrame == 4) { ballFrame = loadImage("ball2.png"); }
      if (currentFrame == 3) { ballFrame = loadImage("ball3.png"); }
      
      //draws the ball in the frame.
      image(ballFrame, lazerXpos -10, lazerYpos -10, 40, 40);
      
      // Updates the lazer position.
      lazerXpos += lazerXSpeed;
      lazerYpos += lazerYSpeed;
    }
    
    // Remove the lazer.
    if (lazerXpos > PlayerXpos + 200 || lazerXpos < PlayerXpos - 200 || lazerYpos > PlayerYpos + 200 || lazerYpos < PlayerYpos - 200) {
      fireLazer = false;
      lazerXpos = 0;
      lazerYpos = 0;
    }
    // Sets the lazer position to a array, to be able to return it, so that the enemies script can recognize it and check if it hit the enemy.
    int[] lazerPos = new int[2];
    lazerPos[0] = lazerXpos;
    lazerPos[1] = lazerYpos;
    return lazerPos;
  }
  void FireLazer() {
    
    // Controles the Lazer direction.
    if (mouseX > PlayerXpos) {  lazerXSpeed = int(cos(atan( (mouseY - PlayerYpos) / (mouseX - PlayerXpos) ))*10); }
    if (mouseX < PlayerXpos) {  lazerXSpeed = int(cos(atan( (mouseY - PlayerYpos) / (mouseX - PlayerXpos) ))*10) * -1; }
    lazerXpos = PlayerXpos;
    if (mouseY > PlayerYpos) {  lazerYSpeed = int(cos(atan( (mouseX - PlayerXpos) / (mouseY - PlayerYpos) ))*10); }
    if (mouseY < PlayerYpos) {  lazerYSpeed = int(cos(atan( (mouseX - PlayerXpos) / (mouseY - PlayerYpos) ))*10) * -1; }
    lazerYpos = PlayerYpos;
    
    //Draws the Lazer 
    fireLazer = true;
  }
  //only Used when debugging
  void Debug() {
    println("lazerXpos=:" + lazerXpos + " lazerYpos=:" + lazerYpos + " lazerXSpeed=:" + lazerXSpeed + " lazerYSpeed=:" + lazerYSpeed);
  }
}
