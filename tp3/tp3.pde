//Link de YouTube: https://youtu.be/yO71SApuUOY

// VARIABLES 
PImage img; // variable para la foto
int alternateColors = 0; // variable para alternar colores

void setup() {
  size(800, 400); // tamano ventana
  img = loadImage("OpArt.png"); // imagen desde data
}

void draw() {
  background(255); // fondo

  // Foto en posición (0, 0) , tamano 400x400
  image(img, 0, 0, 400, 400);
  
  // config. de cuadrícula
  int gridSize = 10; // cuadricula (10x10)
  int squareSize = 40; // tamano cada cuadrado (400px/ 10)
  
  // cuadricula en el lado derecho
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      // coordenadas cada cuadradito
      int x = 400 + i * squareSize;
      int y = j * squareSize;
      
      // alternar colores de cuadrados y elipses
      color squareColor;
      color ellipseColor;

      if (alternateColors == 0) { // blanco y negro
        if ((i + j) % 2 == 0) {
          squareColor = color(0); // negro
          ellipseColor = color(255); // blanco
        } else {
          squareColor = color(255); // blanco
          ellipseColor = color(0); // negro
        }
      } else if (alternateColors == 1) { // violeta y naranja
        if ((i + j) % 2 == 0) {
          squareColor = color(87, 17, 228); // violeta
          ellipseColor = color(255, 81, 0); // naranja
        } else {
          squareColor = color(255, 81, 0); // naranja
          ellipseColor = color(87, 17, 228); // violeta
        }
      } else { // Colores aleatorios
        squareColor = color(random(255), random(255), random(255));
        ellipseColor = color(255 - red(squareColor), 255 - green(squareColor), 255 - blue(squareColor));
      }

      fill(squareColor);
      rect(x, y, squareSize, squareSize);
      
      fill(ellipseColor);
      ellipse(x + squareSize / 2, y + squareSize / 2, squareSize / 2, squareSize / 2);
    }
  }
}

// funcion para eventos de mouse
void mousePressed() {
  alternateColors = (alternateColors + 1) % 3; // Alternar entre 0, 1 y 2
}

// funcion para eventos de teclado
void keyPressed() {
  alternateColors = (alternateColors + 1) % 3; // Alternar entre 0, 1 y 2
}
