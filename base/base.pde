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

int x1= 425;
int y1= 130; 
int x2= 500;
int y2= 100; 


int rad = 60;        // Width of the shape -- needed so that imgs can stay within frame



float xpos, ypos;    // Starting position of cow (aka soldier)   

// both of these below are needed to move cow vertically
float yspeed = 2.2;  // Speed of the shape 
int ydirection = 1;  // Top to Bottom

void setup() {
  size (1280, 720); 
  background(200); 
  backGround = loadImage ("background.png"); 
  blackHole = loadImage ("blackhole.gif");
  soldier = loadImage ("soldier.png"); 
  down1 = loadImage ("https://www.openprocessing.org/sketch/467916/files/rpg_battle_sprite_by_disnie-d80y5td.png"); 
  down2 = loadImage ("https://www.openprocessing.org/sketch/467916/files/2.png"); 
  up1 = loadImage ("https://www.openprocessing.org/sketch/469305/files/3.png"); 
  
  xpos = 0;
  ypos = height/2;
}

void draw() {
  image (backGround, 0, 0); 
  image(soldier, xpos, ypos);
  image (down1, x1, y1, 55, 75); 
  ypos = ypos + ( yspeed * ydirection );
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

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
