PFont mediumFont;//font needed for screen
PFont Font1;//font needed for screen
int state=0;// to start the page
// added random comment

PImage backGround; // background
PImage soldier; // cow
PImage initState;//initial char render
PImage down1; // person1
PImage down2; // person1
PImage up1; // person1
PImage left; //person1
PImage right; //person2
PImage army; // enemy1
PImage blackHole; // enemy2
PImage truck; // enemy3
PImage rocks; // enemy4
PImage tank1; 
PImage tank2;
PImage rock1; 
PImage rock2;
PImage rock3;
PImage soldier_down; 
PImage img_holder; 



int x1= 425;
int y1= 130; 


float x_tank, y_tank, x1_speed = 5,y1_speed=3;
float x_tank2 ,y_tank2,x2_speed=7,y2_speed=4;
int tank_dir_x = 1, tank_dir_y =1;

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
  x_solder = 0;
  y_solder = height/2;
  // COME BACK TO THESE TWO -- COLLISION
  //down1_x = (width - down1.width)/2;
  //down1_y = (height - down1.height)/2;
}

void draw() {
  image (backGround, 0, 0); 
  image(soldier, x_solder, y_solder);
  image (initState, x1, y1, 55, 75); 
  image(rock1,  400, 200, 180, 180);
  image(rock2,  800, 301, 80, 80);
  image(rock3,  150, 500, 180, 180);
  boolean facing = true; 
  
  //=================================================================//            //soldier attribute //
  
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
  
  
  
  
  //===================================================================//        //collision machanic //
  if(pp_collision(rock1,400,200,initState,x1,y1)){
    text("hello",200,100);
  }
  
  if(pp_collision(rock2,800,301,initState,x1,y1)){
    text("OOH SHIT",200,100);                                                  
  }
  
   if(pp_collision(rock3,200,500,initState,x1,y1)){
    text("OOH SHIT",200,100);
  }
  
  if(pp_collision(soldier,x_solder,y_solder,initState,x1,y1)){
    text("FK YOUUU",200,100);
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
