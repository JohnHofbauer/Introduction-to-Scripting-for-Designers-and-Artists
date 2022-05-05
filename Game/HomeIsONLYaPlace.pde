/* This is John Hofbauer's Home is only a place. 
   Part three of project 
   
   The key comands for this program are as follows, 
 Player one:
   1. 'w', 'W', 'Space' used for player one to jump
   2. 'a', 'A' used for player one to move left.
   3. 'd', 'D' used for player one to move right.
   4. 'p', 'P' used to pause and restart the game.
 Player two:
   5. "mouse movement' used to controle player two's movement.
   6. 'Mouse left click' used for player two to shoot the lazer.
 Game Operator:
   7. 'h' 'H' to cheat
*/

// Boolean for the the porgram to keep track of the stages of the program.
public boolean pauseMenu = true;
public boolean drawCharicter = true;
public boolean drawWorld = true;
public boolean jumpping = false;
public boolean createWorld = true;
public boolean settingUpGame = true;
public boolean cheating = false;
public boolean youWin = false;

public boolean moveLeft = false;
public boolean moveRight = false;

public int groundHeight = 400;
public int grav = 0;

//Player ONE
public int windowPosition = 0;
public int Player1PosX = 50;
public int Player1PosY = 100;
public float Player1Size = .2;
public boolean Player1HittingWall = false;
public int Player1Health = 0;
public int Player1JumpHeight = 12;
public int aceleration = 2;
public int velocity = 0;

//Player TWO
public PlayerTwo Player2 = new PlayerTwo();

//ART
public ART art = new ART();

// Enemies class
int numOfEnimes = 100;
public Enemies[] Enemie = new Enemies[numOfEnimes];

// Creates an array for the world hights to be set to.
public float worldSize = random(30,50);
public int[] world = new int[int(worldSize)];

//Creates the objects for the images
PImage menue;
PImage splash;

// cretes the into time verable int.
public int introTime = 50; 

PFont font;
void setup() {
  // These first few commands create the window and set the size and background color.
  // This also sets the default line thickness and fill color to <smooth, and noFill> respectivly.
  size(1500,800);
  background(100,100,255);
  smooth(4); //for 4x anti-aliasing.
  noFill(); // sets rectangles to no fill
  frameRate(60); // sets the refresh rate of the screen, the defult is 120 
  font = createFont("Arial",16,true); // Sets the defult font for the text to display.
  
  // Creates all the objects in the array.
  for (int i = 0; i < numOfEnimes - 1; i++) {
    Enemie[i] = new Enemies();
  }
}
// Main menue, takes place in the house where the two players, are able to begin there adventure
// The main menue is a function that can also be called for the pause menue at any point in the game. 

// called when the game starts or when you press pause. 
void mainMenu() { 
  
  if (introTime > 0 ) { 
    // Spalash Screen (logo). 
    splash = loadImage("splash.jpg"); // Sets the location for the object to the image file.
    image(splash, 0 , 0, 1500, 800); // sets the menue, photo in the window. 
    fill(0,0,100);
    rect(1500 - introTime* 7,0,1500 - introTime* 15, 20);
    noFill();
    introTime--;
  }
  else {
    menue = loadImage("T Page.jpg"); // Sets the location for the object to the image file.
    image(menue, 0 , 0, 1500, 800); // sets the menue, photo in the window. 
  }
}

// image object for winning text.
PImage win;
void WinningMenu() { 
  
  // adds the image to the frame.
  win = loadImage("Win.png"); // Sets the location for the object to the image file.
  image(win, 500 , 80, 400, 400); // sets the mountions, photo in the window. 
  
  // This cretes the text for the screen 
  textFont(font);       
  fill(255,0,0);
  textAlign(CENTER);
  text("Play Again? <press X>",width/2,400); 
  noFill();
  //print("You Win");
   
}
void Charicter() { 
  art.drawPlayerOne(Player1PosX, Player1PosY, Player1Size);
  
  // This cretes the text for the screen 
  textFont(font);       
  fill(255,255,255);
  textAlign(CENTER);
  text("Player One Health" + Player1Health,width/2,60);
  noFill();
}

void jump() {
  // moves the player up the full length of the jump.
  Player1PosY -= Player1JumpHeight;
  Player1JumpHeight -= 1;
  
  // When the player charicter is finished riseing, the jump is reset and gravity takes over.
  if (Player1JumpHeight == 0) { 
    jumpping = false; 
    Player1JumpHeight = 12; }
}
void gravity() {
  
  if (Player1PosY < groundHeight) {   
    // used phisics to accelerate player one's charicter down.
    velocity = aceleration * 4;
    Player1PosY = Player1PosY + velocity;
  }
  
  // Resets the players jump height.
  else { 
  Player1JumpHeight = 12;  
  grav = 0;
  velocity = 0;
  }
}

// Declares the image object moutains and moon, for later use. 
PImage mountains;
PImage moon;


// Function world() is used for when the player is in the game. This is not called when the user is in the menu screen.
void world() {

  // Draws the mountain background images.
  mountains = loadImage("pixil-frame-0 (10).png"); // Sets the location for the object to the image file.
  image(mountains, int(windowPosition/4) , -50, 2000, 900); // sets the mountions, photo in the window. 
  mountains = loadImage("pixil-frame-0 (9) - Copy.png"); // Sets the location for the object to the image file.
  image(mountains, 400 + windowPosition/8 , 100); // sets the moon, photo in the window. 
    
    
  // Creates the world in an array
  if (createWorld == true) {
    float prevousHeight = 0;
    int upDown = 1;
    
    // Creates one 100 px long floor level, and has a random chance of going up or down, compaired to the prevous floor.
    for (int i = 0; i < worldSize-1; i++){
      float rand = int(random(0, 2));
      if (rand == 1) { upDown = -1; }
      else { 
        upDown = 1;
      }
      prevousHeight = prevousHeight + random(10, 20) * upDown;
      world[i] = int(300 + prevousHeight); 
      Enemie[i].enemieY = world[i];
    }
    
    // When finished creatting the map, the first three level heights are sent to the consle.
    println("The world layers are: " + world[0] + " AND " + world[1] + " AND " + world[2]);
    createWorld = false;
  }
  // draws the world
  for (int i = 0; i < worldSize-1; i++){

    // Only Draws the world in the PLAYERS VIEW, <SYSTEM RECORCES> 
    if ( i * -100 - 100 < windowPosition &&  i * -100 + 1500>  windowPosition) { 
      if ( i * 100 < Player1PosX + (windowPosition*-1)+ 500 &&  i * 100>  Player1PosX + (windowPosition*-1) - 500) {
      
        line(i*100 + windowPosition, world[i], 100 + i*100 + windowPosition, world[i]);
        PImage Ground;
        Ground = loadImage("pixil-frame-0 (11).png"); // Sets the location for the object to the image file.
         image(Ground, i*100 + windowPosition, world[i] - 70);
    
         if (i %4 == 2) { 
          PImage trees;
          trees = loadImage("pixil-frame-0 (9).png"); // Sets the location for the object to the image file.
          image(trees, i*100 + windowPosition, world[i] - 90);
        }
      }
    }
    // Set the ground height to the current floor level 
    if (Player1PosX > i*100 + windowPosition && Player1PosX < i*100+100 + windowPosition){
      if (Player1PosY > world[i] && settingUpGame == false) {
       Player1HittingWall = true; 
      } 
      else {
        groundHeight = world[i];
        Player1HittingWall = false;
      }
      
      // Used to keep the player above the floor, while the game map is being generated. 
      if (settingUpGame == true) {
        
        //Resets all the game verables.
        drawCharicter = true;
        drawWorld = true;
        jumpping = false;
        createWorld = true;
        settingUpGame = true;
        cheating = false;
        youWin = false;
        
        Player1PosX = 50;
        Player1PosY = 100;
        Player1Size = .2;
        windowPosition = 0;
        Player1HittingWall = false;
        Player1Health = 100;
        groundHeight = world[i];
        
        settingUpGame = false;

      }
    }
  }  
  // DETECTS IF the PLAYER WON THE GAME.
  //println("Player1PosX " + Player1PosX +" windowPosition " +  windowPosition * -1 +  " PosX " + int(Player1PosX + windowPosition * -1) + " worldSize " + int((worldSize - 1) * 50 ));
  if (int(Player1PosX + windowPosition * -1) > int((worldSize - 1) * 100 )) { // for if the player is on the last level 
    youWin = true;
    WinningMenu();
  }
}
// Once the geme starts the word is randomly generated using an array of 100 values from 1 to 30, 
// this is then converted into lines. and then used to create the ground

// After the ground is created the players attack, skill level, and health are set to there pre determand
// values. 

// the users charicter is drawln in. 
void draw() {
  // This resets the screen to white for the new frame.
  
  
  // If the player is dead, then draw the title screen. 
  if (Player1Health == 0) { 
    pauseMenu = true; 
    settingUpGame = true;
  }
  
  // if the pauseMenu is toggled on then it appears in the next frame.
  if (pauseMenu == true) { 
    mainMenu(); 
    drawCharicter = false;
    drawWorld = false;
  }
  else {
    drawCharicter = true;
    drawWorld = true;
    background(20,20,20);
    fill(200,255,255);
    if (youWin == false) { ellipse(Player1PosX, Player1PosY, 600, 400); }
    if (youWin == true) { 
      ellipse(1500/2, 800/2, 1500, 800); 
      WinningMenu(); }
    noFill();
  }
  // if the pauseMenu is toggled on then it appears in the next frame.
  if (drawWorld == true) { world(); }
  
  // if the charicter is needed then it appears in the next frame.
  if (drawCharicter == true) { 
    
    // Draws the player one's charicter.
    Charicter(); 
    
    // Unsed to help debug the program.
    //Player2.Debug();
    
    // Creates the lazer object. 
    int[] Player2LazerPos = new int[2];
    
    // Draws player two.
    Player2LazerPos = Player2.Player();
    
    // This draws the enimes, for every platform. 
    for (int i = 1; i < numOfEnimes - 1; i++) {
      
      // Only Draws the world in the PLAYERS VIEW, <SYSTEM RECORCES> 
      if ( i * -100 - 100 < windowPosition &&  i * -100 + 1500>  windowPosition) { 
        if ( i * 100 < Player1PosX + (windowPosition*-1)+ 300 &&  i * 100>  Player1PosX + (windowPosition*-1) - 300) { 
        
          Enemie[i].DrawEnemies(100 * i+ windowPosition);
          Enemie[i].EnemieColider(Player2LazerPos[0], Player2LazerPos[1]);
      
          // Checks if the player is inside the hit box of the enime, then if true subtracts one heath point for every frame this is true.
          if (Enemie[i].EnimeHit == false && Player1PosX-5 <= Enemie[i].enemieX + Enemie[i].Xpos && Player1PosX+5 >= Enemie[i].enemieX + Enemie[i].Xpos && Enemie[i].enemieY-5 <= Player1PosY && Enemie[i].enemieY+5 >= Player1PosY) {
            Player1Health -= 10;
          }
        }
      }
    }
  }
  
  // For if a key is held, then this will exacute every frame.
  int speed = 1;
  // For cheating. and debugging) 
  if (cheating == true) { speed = 18; }
  else { speed = 3; }
  
  // Move the player based on the keys and if the player is hitting the wall, or the end of the window.
  if (moveRight == true && Player1PosY <= groundHeight && Player1HittingWall == false && youWin == false) { 
    if (Player1PosX > 1320) { 
      windowPosition -= speed;
    }
    else { 
      Player1PosX += speed;
    }
  }
  if (windowPosition > 0 ) { windowPosition = 0; } 
  if (moveLeft == true && Player1PosY <= groundHeight && Player1HittingWall == false && youWin == false && windowPosition < 3) { 
    if (Player1PosX < 10) { 
      windowPosition += speed;
    }
    else { 
      Player1PosX -= speed;
    }
  }
  if (Player1Health <= 0) { 
    Player1PosY = groundHeight - 10; 
    Player1PosX = 10;
  }
  
  
  // calles the jump function.
  if (jumpping == true) { jump(); }
  
  else{ gravity(); }
  if ( Player1PosY == groundHeight) { jumpping = false; }
    // Gravity function, keeps the user on the ground.
  
  // You cannot go below the ground. failsafe
  if (Player1PosY > groundHeight) {
    Player1PosY = groundHeight;
  }
  //print("\nJump=:" + jumpping);
}


// the KeyPressed function is called when a key (any keybord keypress) is pressed.
void keyPressed() {
  
  // 'p' is the macro-keypress for the mainMenu this toggles the output.
  if (key == 'p' || key == 'P'){ 
    if (pauseMenu == false){ pauseMenu = true; } 
    else if(pauseMenu == true){ 
    pauseMenu = false;
    Player1Health = 100;
    }
  }
  
  // restart the game.
  if (key == 'X' || key == 'x'){ 
    settingUpGame = true;
  }
  
  // Turn of cheats.
  if (key == 'H' || key == 'h'){ 
    cheating = true;
    Player2.playerSpeed = 10;
  }
  
  // 'w' or 'Space' is the macro-keypress jump
    if (key == 'w' || key == 'W' || key == 32 ){ 
      if (Player1PosY == groundHeight) {
        jumpping = true; }
    }
    // 'a' is the macro-keypress LEFT
    if (key == 'a' || key == 'A'){ moveLeft = true;}
    // 'd' is the macro-keypress RIGHT
    if (key == 'd' || key == 'D'){ moveRight = true; } 
}
void keyReleased() {
    // 'a' is the macro-keypress LEFT
    if (key == 'a' || key == 'A'){ moveLeft = false;}
    // 'd' is the macro-keypress RIGHT
    if (key == 'd' || key == 'D'){ moveRight = false; } 
}
void mousePressed() {
  Player2.FireLazer();
}
