PImage img;
void setup() {
  size (800, 400); // tamano de la ventana en pixeles
  background (244, 200, 229); // color de fondo en RGB, rosita
  img = loadImage ("cereza.jpg");
}
void draw(){
  //lectura mouse
  println ("X:");
  println (mouseX);
  println ("Y:");
  println (mouseY);
  // sombras 
  image (img, 0, 0, 400, 400);
  noStroke(); // para no tener lineas negras
  fill (86, 45, 43); // color de sombra cereza izquierda
  circle (545, 255, 75); // sombra ubicacion izquierda
  fill (86, 45, 43); //color sombra cereza derecha
  circle (650, 217, 75); // ubicacion sombra cereza derecha
  // cuerpo de la fruta
  fill (143, 34, 23); // color cereza izquierda
  circle (552, 250, 70); //cereza izquierda ubicacion
  fill (143, 34, 23); // color cereza derecha
  circle (655, 212, 70); //cereza derecha ubicacion
  //triangulos punto de union del tallo
  fill (140, 198, 63);
  triangle (541, 219, 565, 217, 555, 234);
  triangle (640, 180, 660, 177, 650, 193); 
  //grosor de linea y color 
  stroke (181, 178, 19); //color de la linea
  strokeWeight (6); //grosor de la linea
  //ubicacion tallo de cereza izq
  line (554, 225, 543, 142);
  line (543, 142, 576, 96);
  //ubicacion tallo cereza derecha
  line (650, 184, 644, 138);
  line (644, 138, 590, 97);
  //punto de union tallos
  stroke (95, 52, 42); //color marron
  strokeWeight (12); // grosor
  line (582, 76, 584, 104);
}
