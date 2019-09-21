PFont mediumFont;//font needed for screen
PFont Font1;//font needed for screen
int state=0;// to start the page

PImage backGround; // background
PImage vaca; // cow
PImage down1; // person1
PImage down2; // person1
PImage up1; // person1
PImage army; // enemy1
PImage blackHole; // enemy2
PImage truck; // enemy3
PImage rocks; // enemy4


int speed1 = 0;// Falling Speed
int speed2= 3;//Falling Speed



int x1= 425;
int y1= 130; 
int x2= 500;
int y2= 100; 

void setup() {
  size (1280, 720); 
  background(200); 
  backGround = loadImage ("background.png"); 
  blackHole = loadImage ("blackhole.gif");
  vaca = loadImage ("https://www.openprocessing.org/sketch/467916/files/bloggif_59fa37a89fa9a.png"); 
  down1 = loadImage ("https://www.openprocessing.org/sketch/467916/files/rpg_battle_sprite_by_disnie-d80y5td.png"); 
  down2 = loadImage ("https://www.openprocessing.org/sketch/467916/files/2.png"); 
  up1 = loadImage ("https://www.openprocessing.org/sketch/469305/files/3.png"); 
}

void draw() {
  image (backGround, 0, 0); 
  image (vaca, x2, y2, 50, 30); 
  image (down1, x1, y1, 55, 75); 
  if ((x2>x1-30 && x2<x1+30) && (y2>y1-20 && y2<y1+20)){ 
  fill (255);
  rect(100, 320, 580, 80); 
  fill (0);
  
 
  stroke(0); 
  fill(255); 
  rect (50, 370, 50, 20); 
  rect (130, 370, 50, 20); 
  fill(0); 

  }}
  
  void mouseClicked(){ 
   if ((mouseX>50 && mouseX<70) && (mouseY>370 && mouseY<420)) 
     rect (100, 100, 50, 50);  
     
 
}

void keyPressed(){ 
if (keyCode== RIGHT) 
  x1=x1+3; // 
if (keyCode==LEFT)
  x1= x1-3; // 
if (keyCode== UP){
  y1=y1-3; 
  down1=up1;
}
  if (keyCode== DOWN){
  y1=y1+3; 
  down1=down2;}
}
