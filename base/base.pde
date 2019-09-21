PFont mediumFont;//font needed for screen
PFont Font1;//font needed for screen
int state=0;// to start the page
// added random comment
boolean gameover = false; 


PImage backGround; // background
PImage initState;//initial char render
PImage down1; // person1
PImage down2; // person1
PImage up1; // person1
PImage left; //person1
PImage right; //person2
PImage army; // enemy1
PImage alien_right; //alien 
PImage alien_left; //alien
PImage blackHole; // enemy2
PImage truck; // enemy3
PImage rocks; // enemy4
PImage tank1; 
PImage tank2;
PImage rock1; 
PImage rock2;
PImage rock3;
PImage soldier_down; 
PImage soldier_up;
PImage soldier_left;
PImage soldier_right;
PImage img_holder; 
PImage img_holder2;
PImage img_holder3;
PImage fgame, starting_pg, winner_pg; 



int x1= 425;
int y1= 130; 


float x_tank, y_tank, x1_speed = 5,y1_speed=3;
float x_tank2 ,y_tank2,x2_speed=7,y2_speed=4;
int tank_dir_x = 1, tank_dir_y =1;

int rad = 60;        // Width of the shape -- needed so that imgs can stay within frame

//float down1_x, down1_y; // COME BACK TO THIS -- COLLISION

float x_soldier, y_soldier;// Starting position of cow (aka soldier)   
float x_soldier2,y_soldier2; 

float x_alien = 350, y_alien = 400, speed_alien = 1.5, direction_alien = 1; 

// both of these below are needed to move cow vertically
float yspeed = 2.2;// Speed of the shape 
float xspeed = 2.2;
int ydirection = 1; // Top to Bottom
int xdirection =1;

void setup() {
  size (1280, 720); 
  background(200); 
  backGround = loadImage ("background.png"); 
  blackHole = loadImage ("blackhole.gif");
  soldier_down = loadImage ("soldier_t.png");
  soldier_up = loadImage("soldier.png");
  soldier_left = loadImage("soldier_l.png");
  soldier_right = loadImage("soldier_r.png"); 
  starting_pg = loadImage("TitleScreen.png");
  winner_pg = loadImage("GameWin.png");
  fgame = loadImage("GameOver.png");
  alien_right = loadImage("alien.png");
  alien_left = loadImage("alien_l.png");
  img_holder = blackHole;
  img_holder2 = blackHole;
  img_holder3 = blackHole;
  tank1 = loadImage ("tank_1.png");
  tank2 = loadImage ("tank_2.png");
  rock1 = loadImage ("rocks_1.png");
  rock2 = loadImage ("rocks_2.png");
  rock3 = loadImage("rocks_2.png");
  initState = loadImage("char_front.png");
  down1 = loadImage ("char_front.png"); 
  up1 = loadImage ("char_back.png"); 
  left = loadImage("char_left.png");
  right = loadImage("char_right.png");
  x_soldier = 100;
  y_soldier = height/2;
   x_soldier2 = width/1.5;
   y_soldier2 =500;
   
   
   
   
}

void draw() {
  if (state == 0) {
    startscreen();
  }
  else if (!gameover) { 
  image (backGround, 0, 0); 
  image(soldier_up, x_soldier, y_soldier);
  image(soldier_right,x_soldier2,y_soldier2);
  image (initState, x1, y1, 55, 75); 
  image (alien_right,x_alien,y_alien,50,60);
  image(rock1,  400, 200, 180, 180);
  image(rock2,  800, 301, 80, 80);
  image(rock3,  150, 500, 180, 180);
  boolean facing = true; 
  boolean facing2 =true;
  boolean facing3 = true; 
  
  //=================================================================//            //soldier 
  
  y_soldier = y_soldier + ( yspeed * ydirection );
  if (y_soldier > height-rad || y_soldier < rad) {
      ydirection *= -1;
      if (facing) { 
        img_holder=soldier_up;
        soldier_up = soldier_down; 
        soldier_down=img_holder;
        facing = false; 
      } else {
          facing = true; 
          soldier_down = soldier_up;
      }
  }
  
  x_soldier2 = x_soldier2 + ( xspeed * xdirection );
  if (x_soldier2 > width-rad || x_soldier2 < rad) {
      xdirection *= -1;
      if (facing2) { 
        img_holder2 = soldier_left;
        soldier_left = soldier_right; 
        soldier_right=img_holder2;
        facing2 = false; 
      } else {
          facing2 = true; 
          soldier_right = soldier_left;
      }
  }
  
  
 
//=================================================================//  
  x_tank =x_tank +( x1_speed *tank_dir_x); 
  y_tank =y_tank +(y1_speed*tank_dir_y);
  
  if ((x_tank > width-rad||x_tank<0)) {
    tank_dir_x *= -1; 
  }
  if((y_tank>height-rad||y_tank<0)){
    tank_dir_y*=-1;
  }
  image(tank1, x_tank, y_tank, 100, 100);
                                                                        //TANK Movement 
  
  
   x_tank2 =x_tank2 +((x2_speed) *tank_dir_x);   
  if ((x_tank2 > width-rad||x_tank2<0)) {
    tank_dir_x *= -1; 
  }
  if((y_tank2>height-rad||y_tank2<0)){
    tank_dir_y*=-1;
  }
  image(tank2, x_tank2, y_tank2, 80, 80);
  
  //===================================================================//
  
  //===================================================================//  //Alien Attribute 
  
  x_alien = x_alien + (speed_alien*direction_alien);
  
  if((x_alien>width||x_alien<0)){
    direction_alien *= -1;
    
    if(facing3){
      
      img_holder3 = alien_right;
      alien_right = alien_left;
      alien_left = img_holder3;
      facing3 = false;
      }else{
        facing3 = true; 
        alien_right = alien_left;
      }
      
  }
  
  
  
 
  
  //===================================================================//        //collision machanic //
  if(pp_collision(rock1,400,200,initState,x1,y1)){
    text("Oh snap! That hurt!!!", 200, 100); 
    textSize(35);
    fill(255, 0, 0);
  }
  
  if(pp_collision(rock2,800,301,initState,x1,y1)){
    text("Oh snap! That hurt!!!", 200, 100); 
    textSize(35);
    fill(255, 0, 0);                                               
  }
  
   if(pp_collision(rock3,200,500,initState,x1,y1)){
    text("Oh snap! That hurt!!!", 200, 100); 
    textSize(35);
    fill(255, 0, 0);
  }
  
  if(pp_collision(soldier_up,x_soldier,y_soldier,initState,x1,y1)){
    gameover = true; 
    textSize(35);
    image(fgame, 0, 0, 1280, 720);
    fill(255, 0, 0);
  }
   if(pp_collision(soldier_right,x_soldier2,y_soldier2,initState,x1,y1)){
    gameover = true; 
    textSize(35);
    image(fgame, 0, 0, 1280, 720);
    fill(255, 0, 0);
  }
  if(pp_collision(tank1,x_tank,y_tank,initState,x1,y1)){
    gameover = true; 
    textSize(35);
    image(fgame, 0, 0, 1280, 720);
    fill(255, 0, 0);
  }
  if(pp_collision(tank2,x_tank2,y_tank2,initState,x1,y1)){
    gameover = true; 
    textSize(35);
    image(fgame, 0, 0, 1280, 720);
    fill(255, 0, 0);
  }
  if(pp_collision(alien_right,x_alien,y_alien,initState,x1,y1)){
    textSize(35);
    image(winner_pg, 0, 0, 1280, 720);
    fill(255, 0, 0);
    gameover = true; 
  }
   } else {
      gameover = true; 
  }
  //=====================================================================//
}
     
void keyPressed(){ 
  if (keyCode== RIGHT) { 
    x1=x1+10; // 
    initState=right;
  }
  if (keyCode==LEFT) { 
    x1= x1-10;// 
    initState=left;
  }
  if (keyCode== UP){
    y1=y1-10; 
    initState=up1;
  }
  if (keyCode== DOWN){
    y1=y1+10; 
    initState=down1;
  }
}

void startscreen() {

  background(#c4aca8);
  textAlign(CENTER);
  fill(#660d0d);
  text("   Game", 200, 100); 
  textAlign(CENTER);
  fill(#660d0d);
  text("    1. 1. Use arrows to control the players speed,You have functions such as left and right", 200, 160); 
  text("     2. Do not allign with villan", 200, 180); 
  text("     3. The only function is right-left or left-right", 200, 200); 
  text("    4. Click START to begin (:", 200, 220); 
  stroke(#660d0d); 
  strokeWeight(1); 
  fill(#ffffff);        
  textAlign(CENTER);
  fill(#660d0d);
  image(starting_pg,  0, 0, 1280, 720);
  text("START", 1100, 640); 
  textSize(50);
  if (mousePressed == true) {
    if (mouseX <=1100 && mouseX >= 640 ) {
      state=1;
    }
  }
}


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
