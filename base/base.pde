PFont mediumFont;//font needed for screen
PFont Font1;//font needed for screen
int state=0;// to start the page

PImage backGround; // background
PImage soldier; // cow
PImage down1; // person1
PImage down2; // person1
PImage up1; // person1
PImage army; // enemy1
PImage blackHole; // enemy2
PImage truck; // enemy3
PImage rocks; // enemy4
PImage tank; 
PImage rock1; 
PImage rock2;
PImage soldier_down; 
PImage img_holder; 

int x1= 425;
int y1= 130; 
int x2= 500;
int y2= 100; 

float x_tank, y_tank, x_speed = 5;

int rad = 60;        // Width of the shape -- needed so that imgs can stay within frame

//float down1_x, down1_y; // COME BACK TO THIS -- COLLISION

float x_solder, y_solder;    // Starting position of cow (aka soldier)   

// both of these below are needed to move cow vertically
float yspeed = 2.2;  // Speed of the shape 
int ydirection = 1;  // Top to Bottom

void setup() {
  size (1280, 720); 
  background(200); 
  backGround = loadImage ("background.png"); 
  blackHole = loadImage ("blackhole.gif");
  soldier_down = loadImage ("soldier_t.png");
  soldier = loadImage("soldier.png");
  img_holder = blackHole;
  tank = loadImage ("tank_1.png");
  rock1 = loadImage ("rocks_1.png");
  rock2 = loadImage ("rocks_2.png");
  down1 = loadImage ("https://www.openprocessing.org/sketch/467916/files/rpg_battle_sprite_by_disnie-d80y5td.png"); 
  down2 = loadImage ("https://www.openprocessing.org/sketch/467916/files/2.png"); 
  up1 = loadImage ("https://www.openprocessing.org/sketch/469305/files/3.png"); 
  x_solder = 0;
  y_solder = height/2;
  // COME BACK TO THESE TWO -- COLLISION
  //down1_x = (width - down1.width)/2;
  //down1_y = (height - down1.height)/2;
}

void draw() {
  image (backGround, 0, 0); 
  image(soldier, x_solder, y_solder);
  image (down1, x1, y1, 55, 75); 
  image(rock1,  400, 200, 180, 180);
  image(rock2,  800, 301, 80, 80);
  image(rock2,  150, 500, 180, 180);
  boolean facing = true; 
  y_solder = y_solder + ( yspeed * ydirection );
  if (y_solder > height-rad || y_solder < rad) {
      ydirection *= -1;
      if (facing) { 
        img_holder=soldier;
        soldier = soldier_down; 
        soldier_down=img_holder;
        facing = false; 
      } else {
          facing = true; 
          soldier_down = soldier;
      }
  }
  x_tank += x_speed; 
  image(tank, x_tank, y_tank, 100, 100);
  if (x_tank > width || x_tank < 0) {
    x_speed *= -1; 
  }
  
  // -----
  
  // COME BACK TO THIS -- COLLISION
  // if(pp_collision(down1,down1_x,down1_y,f2,mouseX,mouseY)){
  //  stroke(255,64,64);
  //  strokeWeight(1);
  //  noFill();
  //  rect(f1x,f1y,f1.width,f1.height);
  //  rect(mouseX,mouseY,f2.width,f2.height);
  //}
}
     
void keyPressed(){ 
  if (keyCode== RIGHT) { 
    x1=x1+10; // 
  }
  if (keyCode==LEFT) { 
    x1= x1-10; // 
  }
  if (keyCode== UP){
    y1=y1-10; 
    down1=up1;
  }
  if (keyCode== DOWN){
    y1=y1+10; 
    down1=down2;
  }
} 

/* NEEDED FOR COLLISION -- COME BACK TO THIS
final int ALPHALEVEL = 20;

boolean pp_collision(PImage imgA, float aix, float aiy, PImage imgB, float bix, float biy) {
  int topA, botA, leftA, rightA;
  int topB, botB, leftB, rightB;
  int topO, botO, leftO, rightO;
  int ax, ay;
  int bx, by;
  int APx, APy, ASx, ASy;
  int BPx, BPy; //, BSx, BSy;

  topA   = (int) aiy;
  botA   = (int) aiy + imgA.height;
  leftA  = (int) aix;
  rightA = (int) aix + imgA.width;
  topB   = (int) biy;
  botB   = (int) biy + imgB.height;
  leftB  = (int) bix;
  rightB = (int) bix + imgB.width;

  if (botA <= topB  || botB <= topA || rightA <= leftB || rightB <= leftA)
    return false;

  // If we get here, we know that there is an overlap
  // So we work out where the sides of the overlap are
  leftO = (leftA < leftB) ? leftB : leftA;
  rightO = (rightA > rightB) ? rightB : rightA;
  botO = (botA > botB) ? botB : botA;
  topO = (topA < topB) ? topB : topA;


  // P is the top-left, S is the bottom-right of the overlap
  APx = leftO-leftA;   
  APy = topO-topA;
  ASx = rightO-leftA;  
  ASy = botO-topA-1;
  BPx = leftO-leftB;   
  BPy = topO-topB;

  int widthO = rightO - leftO;
  boolean foundCollision = false;

  // Images to test
  imgA.loadPixels();
  imgB.loadPixels();

  // These are widths in BYTES. They are used inside the loop
  //  to avoid the need to do the slow multiplications
  int surfaceWidthA = imgA.width;
  int surfaceWidthB = imgB.width;

  boolean pixelAtransparent = true;
  boolean pixelBtransparent = true;

  // Get start pixel positions
  int pA = (APy * surfaceWidthA) + APx;
  int pB = (BPy * surfaceWidthB) + BPx;

  ax = APx; 
  ay = APy;
  bx = BPx; 
  by = BPy;
  for (ay = APy; ay < ASy; ay++) {
    bx = BPx;
    for (ax = APx; ax < ASx; ax++) {
      pixelAtransparent = alpha(imgA.pixels[pA]) < ALPHALEVEL;
      pixelBtransparent = alpha(imgB.pixels[pB]) < ALPHALEVEL;

      if (!pixelAtransparent && !pixelBtransparent) {
        foundCollision = true;
        break;
      }
      pA ++;
      pB ++;
      bx++;
    }
    if (foundCollision) break;
    pA = pA + surfaceWidthA - widthO;
    pB = pB + surfaceWidthB - widthO;
    by++;
  }
  return foundCollision;
}
*/
