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
  size (1280, 720); // Tamany del projecte.
  background(200); // Color de fons (que no es veura ja que posarem la imatge que es de la mateixa mida).
  backGround = loadImage ("https://www.openprocessing.org/sketch/467916/files/facfc027-7257-4422-bce9-adec4c359ce7.jpg"); // Càrrega de la imatge de fons.
  vaca = loadImage ("https://www.openprocessing.org/sketch/467916/files/bloggif_59fa37a89fa9a.png"); // Càrrega de la vaquita felis.
  down1 = loadImage ("https://www.openprocessing.org/sketch/467916/files/rpg_battle_sprite_by_disnie-d80y5td.png"); // Càrrega de la image personatge sense moure
  down2 = loadImage ("https://www.openprocessing.org/sketch/467916/files/2.png"); // Carrega de la imatge del personatge movent-se cap avall
  up1 = loadImage ("https://www.openprocessing.org/sketch/469305/files/3.png"); // Càrrega del personatge movent-se cap amunt
}

void draw() {
  image (backGround, 0, 0); // La imatge de fons es posa aquí per fer-la carregar tota l'estona per a que no es vegin altres pilotes
  image (vaca, x2, y2, 50, 30); // Les coordenades de la bola fixa
  image (down1, x1, y1, 55, 75); // Les coordenades de la bola que es mou
  if ((x2>x1-30 && x2<x1+30) && (y2>y1-20 && y2<y1+20)){ // La condició per la col·lisió
  fill (255);
  rect(100, 320, 580, 80); // Rectangle que surt si estem al costat de La Vaquita Felis :3// error here 
  fill (0);
  text ("Hola soy la Vaquita Felis :3", 40, 340); // Text que surt dins del rect
  text ("¿Dar de comer a la Vaquita Felis :3?", 40, 360); // Text que surt dins del rect
  stroke(0); 
  fill(255); 
  rect (50, 370, 50, 20); // Primer rectangle 
  rect (130, 370, 50, 20); // Segon rectangle
  fill(0); 
  text ("Chi :D", 60, 385); // Text del primer rectangle
  text ("Nu >:D", 137, 385); // Text del segon rectangle
  }}
  
  void mouseClicked(){ // Es fa un void mouseclicked perque hi hagi una accio quan prenem un dels 2 rectangles
   if ((mouseX>50 && mouseX<70) && (mouseY>370 && mouseY<420)) // Condició del que passa si fem click al primer rect
     rect (100, 100, 50, 50); // Es fa un rect 
     text ("Le diste Hierbita a la Vaquita Felis :3", 100, 100); // Surt un text
  // Hi ha un problema, es que només surt un frame ja que torna al void draw i en molt poc temps desapareix. Ho haig de mirar
}

void keyPressed(){ // Aquest void ens permet interactuar amb tecles
if (keyCode== RIGHT) //With the right key, the ball we want to move will move 3 pixels right
  x1=x1+3; // 
if (keyCode==LEFT)//With the left key, the ball we want to move will move 3 pixels left
  x1= x1-3; // 
if (keyCode== UP){
  y1=y1-3; //With the upward key, the ball we want to move will move 3 pixels upwards
  down1=up1;
}
  if (keyCode== DOWN){
  y1=y1+3; //With the down key, the ball we want to move will move 3 pixels down
  down1=down2;}
}
