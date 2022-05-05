class ART {

// this frame verable is for the ears and eyes to be animated.
public int frame = 0;
public int timing = 0;

// This clears the canvas and creates the creature everytime the screen is updated.
void drawPlayerOne(int x, int y, float size) {

  x -= 30;
  y -= 48;

// HEAD ////////////////////////////////////////////////////////
//Face
stroke(10);
line(x + 100*size,y + 100*size,x + 200*size,y + 100*size);
line(x + 80*size,y + 150*size,x + 100*size,y + 100*size);
line(x + 80*size,y + 150*size,x + 100*size,y + 150*size);
line(x + 200*size,y + 100*size,x + 180*size,y + 150*size);
line(x + 160*size,y + 150*size,x + 180*size,y + 150*size);
line(x + 200*size,y + 100*size,x + 220*size,y + 140*size);
line(x + 183*size,y + 145*size,x + 220*size,y + 140*size);
//Mouth
arc(x + 125*size,y + 143*size,10*size,10*size,0,PI);
arc(x + 135*size,y + 143*size,10*size,10*size,0,PI);
arc(x + 130*size,y + 148*size,10*size,20*size,0,PI);

if (frame == 0 && timing < 140) {
  //eyes
  //left EYE
  ellipseMode(CENTER);
  ellipse(x + 110*size,y + 125*size,15*size,30*size);
  arc(x + 115*size,y + 125*size,10*size,10*size,PI/2,3*PI/2);
  ellipse(x + 110*size,y + 120*size,5*size,5*size);
  arc(x + 105*size,y + 140*size,15*size,10*size,1*PI/4,3*PI/4);
  //PUPIL
  fill(0,0,0);
  ellipse(x + 116*size,y + 126*size,2*size,3*size);
  noFill();
  //Right EYE
  ellipse(x + 160*size,y + 125*size,15*size,30*size);
  arc(x + 153*size,y + 125*size,10*size,10*size,-PI/2,PI/2);
  ellipse(x + 160*size,y + 120*size,5*size,5*size);
  arc(x + 165*size,y + 140*size,15*size,10*size,1*PI/4,3*PI/4);
  //PUPIL
  fill(0,0,0);
  ellipse(x + 153*size,y + 126*size,2*size,3*size);
  noFill();
} 
if (frame > 0) { frame ++; }
if (timing > 0) { timing ++; }
if (timing > 140) { 
    frame = 0; 
    //eyes
  //left EYE
  ellipseMode(CENTER);
  line(x + 110*size,y + 125*size,x + 120*size,y + 125*size);
  arc(x + 110*size,y + 125*size,15*size,30*size,0,PI);
  //under the eye.
  arc(x + 105*size,y + 139*size,15*size,10*size,1*PI/4,3*PI/4);
  
  //Right EYE
  line(x + 160*size,y + 125*size,x + 170*size,y + 125*size);
  arc(x + 160*size,y + 125*size,15*size,30*size,0,PI);
  //under the eye
  arc(x + 165*size,y + 139*size,15*size,10*size,1*PI/4,3*PI/4);
}
//print("On frame #" + frame + "\n");

// this is the first and the last frame in the series.
if (frame > 0 && frame < 6 || frame > 12 && frame < 18 ) {
    //eyes
  //left EYE
  ellipseMode(CENTER);
  line(x + 102*size,y + 125*size,x + 116*size,y + 125*size);
  arc(x + 110*size,y + 125*size,15*size,30*size,0,PI);
  //under the eye.
  arc(x + 105*size,y + 139*size,15*size,10*size,1*PI/4,3*PI/4);
  
  //Right EYE
  line(x + 152*size,y + 125*size,x + 166*size,y + 125*size);
  arc(x + 160*size,y + 125*size,15*size,30*size,0,PI);
  //under the eye
  arc(x + 165*size,y + 139*size,15*size,10*size,1*PI/4,3*PI/4);
}

// This is the middle frame, when the eyes are fully closed.
if (frame >= 6 && frame <= 12 ) {
    //eyes
  //left EYE
  ellipseMode(CENTER);
  arc(x + 110*size,y + 125*size,15*size,30*size,1*PI/4,3*PI/4);
  //under the eye.
  arc(x + 105*size,y + 139*size,15*size,10*size,1*PI/4,3*PI/4);
  
  //Right EYE
  arc(x + 160*size,y + 125*size,15*size,30*size,1*PI/4,3*PI/4);
  //under the eye
  arc(x + 165*size,y + 139*size,15*size,10*size,1*PI/4,3*PI/4);
}
if (frame >= 18) { frame = 0; }

// BODY ////////////////////////////////////////////////////////
line(x + 90*size,y + 150*size,x + 100*size,y + 190*size);
line(x + 170*size,y + 150*size,x + 180*size,y + 190*size);
line(x + 100*size,y + 190*size,x + 180*size,y + 190*size);
line(x + 180*size,y + 190*size,x + 210*size,y + 183*size);
line(x + 210*size,y + 183*size,x + 220*size,y + 140*size);
//tatoos
line(x + 105*size,y + 160*size,x + 135*size,y + 170*size);
line(x + 105*size,y + 170*size,x + 135*size,y + 180*size);
line(x + 155*size,y + 160*size,x + 135*size,y + 170*size);
line(x + 155*size,y + 170*size,x + 135*size,y + 180*size);

// EARS ////////////////////////////////////////////////////////
arc(x + 100*size,y + 70*size,20*size,60*size,0,2*PI);
arc(x + 200*size,y + 59*size,70*size,80*size,8*PI/4,10*PI/4);
arc(x + 236*size,y + 99*size,70*size,80*size,4*PI/4,6*PI/4);

// LEGS ////////////////////////////////////////////////////////
ellipse(x + 180*size,y + 210*size,8*size,40*size);
ellipse(x + 100*size,y + 210*size,8*size,40*size);
ellipse(x + 210*size,y + 203*size,8*size,40*size);
arc(x + 160*size,y + 190*size,10*size,60*size,0,PI);

// TAIL ////////////////////////////////////////////////////////
arc(x + 255*size,y + 175*size,100*size,100*size,5*PI/4,6.2*PI/4);
arc(x + 216*size,y + 110*size,100*size,100*size,8.4*PI/4,10*PI/4);


  //time in between drooling
  if (timing > 250) { 
  timing = 140; }
}

}
