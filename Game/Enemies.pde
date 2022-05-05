PImage enemyHead;

class Enemies {
  
 // Enemies Varables.
 int Xpos = 0;
 boolean goingRight = true;
 boolean EnimeHit = false;
 int enemieX = 0;
 int enemieY = 0;
 int knockOutTime = 200;
 
 // Called in the updateFrame function <Draw>. Renders the Enemie in the frame 
 void DrawEnemies(int enemieXpos) {
   // knockout time = 200 frames.
   if ( EnimeHit == true) { knockOutTime--; } 
   if (knockOutTime == 0) { 
     EnimeHit = false;
     knockOutTime = 200;
   }
   
   
   enemyHead = loadImage("pixil-frame-0 (4).png");
   
   
   // Checks to see if the enemie is dead.
   if (EnimeHit == false) { 
     
     //Draws the enime sprite.   
     image(enemyHead, enemieXpos + Xpos - 20, enemieY - 35,50,50);
   
     // Change the direction. 
     if (Xpos == 100) { goingRight = false; }
     if (Xpos == 0) { goingRight = true; }
   
     // Move the charicter.
     if (goingRight == true) { Xpos += 1; }
     if (goingRight == false) { Xpos -= 1; }
     
     // Update the enemies position public var.
     enemieX = enemieXpos;
   } 
 }
 
 // Function called, returnes true if the enemie is hit, by the player or the lazer.
 boolean EnemieColider(int PosX, int PosY) {
   //stop enemies from spawning outside the map.
   if (enemieY == 0 && goingRight == false) {
     EnimeHit = true;
   }
   // Checks if the position of the object is withen 5 px radis. 
   if (PosX-10 <= enemieX + Xpos && PosX+10 >= enemieX + Xpos && enemieY-15 <= PosY && enemieY+10 >= PosY) {
     EnimeHit = true;
   }
   return EnimeHit;
 }
}
