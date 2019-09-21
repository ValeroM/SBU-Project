PImage fons; // Variable imatge de fons.
PImage vaca; // La vaquita felis :3
PImage down1; // La Imatge del personatge quan no es mou i mira cap avall
PImage down2; // La imatge del personatge quan es mou cap avall
PImage up1; // La imatge del personatge quan mira cap adalt (No funciona)
int x1= 425; // Posició X per al personatge que volem gestionar.
int y1= 130; // Posició Y per al personatge que volem gestionar.
int x2= 500; // Posició X del personatge amb el que volem interactuar.
int y2= 100; //Posició Y del personatge amb el que volem interactuar.
void setup() {
  size (1280, 720); // Tamany del projecte.
  background(100); // Color de fons (que no es veura ja que posarem la imatge que es de la mateixa mida).
  fons = loadImage ("https://www.openprocessing.org/sketch/467916/files/facfc027-7257-4422-bce9-adec4c359ce7.jpg"); // Càrrega de la imatge de fons.
  vaca = loadImage ("https://www.openprocessing.org/sketch/467916/files/bloggif_59fa37a89fa9a.png"); // Càrrega de la vaquita felis.
  down1 = loadImage ("https://www.openprocessing.org/sketch/467916/files/rpg_battle_sprite_by_disnie-d80y5td.png"); // Càrrega de la image personatge sense moure
  down2 = loadImage ("https://www.openprocessing.org/sketch/467916/files/2.png"); // Carrega de la imatge del personatge movent-se cap avall
  up1 = loadImage ("https://www.openprocessing.org/sketch/469305/files/3.png"); // Càrrega del personatge movent-se cap amunt
}
void draw() {
  image (fons, 0, 0); // La imatge de fons es posa aquí per fer-la carregar tota l'estona per a que no es vegin altres pilotes
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
if (keyCode== UP) 
  x1=x1+3; // Amb la tecla D, la bola que volem moure es desplaçarà 3 pixels cap a la dreta
if (keyCode==LEFT)
  x1= x1-3; // Amb la tecla A, la bola que volem moure es desplaçarà 3 pixels cap a l'esquerra
if (keyCode== RIGHT){
  y1=y1-3; // Amb la tecla W, la bola que volem moure es desplaçarà 3 pixels cap amunt
  down1=up1;
}
  if (keyCode== DOWN){
  y1=y1+3; // Amb la tecla S, la bola que volem moure es desplaçarà 3 pixels cap abaix
  down1=down2;}
}
