/* This is John Hofbauer's creature. 
   Part one of project <betterMSpaint but not really>, for art 200 at Penn State.
   
   The key comands for this program are as follows, 
   1. 'C' is used to clear the canvas 
   2. 'A' is ised to draw abstract rectangles, with heights and widths the size of the position of the mouse.
   2. 'L' is used to return the program back to drawing lines.
   4. 'E' is a shortcut comand to the eraser, because I found myself needing it a lot, so after a while I just added it in.
*/

Animations animation = new Animations();

// The boolean's and int are created as public verables outside the functions, and set to there defult value as the program starts.
// These verables are public so that other classes ( if I decide to add them ) and classes can access and change there value.
public boolean clearScreen = true;
public boolean lineMode = true;
public boolean acadent = false;
public boolean drawStar = false;
public boolean eraser = false;
public int thick = 0;
public float x,y,z;

// This setup function is called once at the beginning of the program to run and set up the window's defult look.
void setup() {
  
  // These first few commands create the window and set the size and background color.
  // This also sets the default line thickness and fill color to <smooth, and noFill> respectivly.
  size(1500,800,P3D);
  x = width/2;
  y = height/2;
  z = 0;
  background(255,255,255);
  smooth(4); //for 4x anti-aliasing.
  noFill(); // sets rectangles to no fill
  frameRate(120); // sets the refresh rate of the screen, the defult is 60
  toolbar();
  
  
}
//This creates the toolbar
void toolbar() {
  colorPallet();
  animation.Star(.3, 1320, 30);
  eraser();
}

// This draws the eraser in the toolbar.
void eraser() {
  noFill();
  arc(1400,10,30,10,PI,2*PI);
  rect(1385,10,30,40);
}

// My own function to draw the color pallet.
void colorPallet() {  
  // The three local intigers r, g, and b respectively are set to zero, and defined in the outmost layer that uses them.
  int r = 0;
  int g = 0;
  int b = 0;
  
  // The <for loop> is used to run through every color in the rainbow, and each <if statement> inside is used to incroment 
  // the colors of the lines to compleate this.
  for (int x = 0; x < 255*5; x++) { 
    // If there is only one opperation inside the if opperator, there is no need for a seccond line.
    if (x <= 255) { r += 1; }
    if (x > 255 && x < 255 * 2) { g += 1; }
    if (x > 255 * 2 && x < 255 * 3) { r -= 1; }
    if (x > 255 * 3 && x < 255 * 4) { b += 1; }
    if (x > 255 * 4 && x < 255 * 5) { g -= 1; }
    
    // After the new color is set, the line color is set, then the line is made.
    stroke(r, g, b);
    line(x,0,x + 1,100);
    
  }
  // After the color pallet is made the line color is set back to black, since the background is white.
  stroke(0,0,0);
}

// The draw method is called everytime that the program needs to update, which in this case is set to 120 FPS.
void draw() {
  
  
  // This clears the canavs on the screen.
  if (clearScreen == true) {
   stroke(0,0,0);
   fill(255,255,255);
   rect(0,255/4,1500,800);
   clearScreen = false;
  }
  print("\nBrush Thickness: ", thick);
  print("\nMouse Pos X: ", mouseX, "Mouse Pos Y: ", mouseY);
  
  if (drawStar == true) {
    animation.Render(.3, 1320, 30);
  }
}

// the KeyPressed function is called when a key (any keybord keypress) is pressed.
void keyPressed() {
  
  // 'e' is the macro-keypress for the eraser.
  if (key == 'e'){
    if (eraser == false) {
      eraser = true;
      acadent = false;
      drawStar = false;
      stroke(255,255,255);
      fill(255,255,255);
    
      // This turns the eraser red
      stroke(255,0,0);
      eraser();
      stroke(255,255,255);
      thick = 10;
      fill(255,255,255);
    }
    else {
      eraser = false;
      // This turns the eraser back.
      stroke(0,0,0);
      eraser();
      thick = 1;
      fill(0,0,0);
    }
  }
  
  // 'c' is the macro-keypress for clearing the screen.
  if (key == 'c'){ clearScreen = true; }
  
  // 'a' is the macro-keypress for setting the brush to rectangles the width of the mouse position on the screen.
  if (key == 'a'){
    if (acadent == false) {
      acadent = true;
      lineMode = false;
      drawStar = false;
    }
    else { acadent = false; }
  }
  
  //  'l' is the macro-keypress for drawing a line.
  if (key == 'l'){
    if (lineMode == false) {
      lineMode = true;
      acadent = false;
      drawStar = false;
    }
    else { lineMode = false; }
  }
  //  'l' is the macro-keypress for drawing a line.
  if (key == 's'){
    if (drawStar == false) {
      lineMode = false;
      acadent = false;
      drawStar = true;
      }
    else { 
      drawStar = false; 
      stroke(255,255,255);
      animation.Render(.2, 1320, 30);
    }
  }
  
  // 'ARROW-UP and ARROW-DOWN' is the macro-keypress for increasing and decreesing the pixel size of the mouse input.
  if (keyCode == UP) { thick += 1; }
  if (keyCode == DOWN && thick != 0) { thick -= 1; }
}

// the function mouseClicked is called when a mouse (left or right) button is clicked.
void mousePressed() {
  pickColor();
  
  // Toolbar picking.
  if (mouseX > 1288 && mouseX < 1354 && mouseY > 5 && mouseY < 60) {
    if (drawStar == false) {
      lineMode = false;
      acadent = false;
      drawStar = true;
    }
    else { 
      drawStar = false; 
      // Clears the red star
      stroke(255,255,255);
      animation.Star(.2, 1300, 5);
    }
  }
  if (mouseX > 1379 && mouseX < 1418 && mouseY > 0 && mouseY < 60) {
    if (eraser == false) {
      eraser = true;
      acadent = false;
      drawStar = false;
      stroke(255,255,255);
      fill(255,255,255);
    
      // This turns the eraser red
      stroke(255,0,0);
      eraser();
      stroke(255,255,255);
    }
    else {
      eraser = false;
      // This turns the eraser back.
      stroke(0,0,0);
      eraser();
      fill(0,0,0);
    }
  }
  // This draws the star if the tool is selectecd.
  if (drawStar == true) {
    float starSize = random(.1,1);
    
    // This checks to make sure that the user is not placing the star in the toolbar
    if (mouseY > 68 + starSize * 90) {
      animation.Star(starSize, int(mouseX), int(mouseY));
    }
  }
}

// my own color picking function.
void pickColor() {
  // This makes sure that the user's mouse is overtop of the color pallet befor setting a color.
  if (mouseY < 63) {
    
    // The preset verables are defined and set.
    int r = 0;
    int g = 0;
    int b = 0;
    
    // Used to see if the mouse is over any red color.
    if (mouseX > 0 && mouseX < 225 *3) {
      r = mouseX;
      if (mouseX > 255 * 2) {
        r = ((255 * 3) - mouseX);
      }
    }
    else { r = 0; }
    
    // Used to see if the mouse is over any green color.
    if (mouseX > 225*1 && mouseX < 225*5) {
      g = (mouseX - 225*1);
      if (mouseX > 255 * 4) {
        g = ((255 * 5) - mouseX);
      }
    }
    else { g = 0; }
    
    // Used to see if the mouse is over any blue color.
    if (mouseX > 225*3 && mouseX < 225*6) {
      b = (mouseX - 225*3);
    }
    else { b = 0; }
    
    // This sets the color picked to the brush.
    stroke(r,g,b);
    fill(r,g,b);
    println("red",r,"green",g,"blue",b);
   
  }
}

// This function is called when ever the mouse is pressed and the mouse position is moving.
void mouseDragged() {
  
  // This is used to make sure that the user cannot draw inside the color pallot on the top of the screen.
  if (mouseY > 63 + thick/2) {
    
    // this make sure the program is on <lineMode = true> then creates a rectangle the thickness desired, every frame.
    if (lineMode == true) {
      
      rect(mouseX - thick/2, mouseY - thick/2, 1 + thick, 1 + thick);
    }
    
    // If rectangle mode is selected then a rectangle is made every frame the mouse is dragged.
    if (acadent == true) {
      fill(255,255,255);
      rect(mouseX - thick, mouseY - thick, mouseX, mouseY);
    }
    // if a rectangle is not being drawn then the defult set is a line.
    // This draws the star if the tool is selectecd.
    if (drawStar == true) {
      float starSize = random(.1,1);
    
      // This checks to make sure that the user is not placing the star in the toolbar
      if (mouseY > 68 + starSize * 90) {
        animation.Star(starSize, int(mouseX), int(mouseY));
      }
    }
    else { lineMode = true; }
  }
}
