// VARIABLES
PImage[] images; 
int currentImage = 0; // control para ver que imagen se muestra
int imageDuracion = 4000; // tiempo: 4 seg por imagen
int lastChangeTime = 0; // registro del tiempo en el que se cambió la imagen por última vez

// VARIABLE TEXTO
String[] textos = {
  "El amor en los tiempos del cólera",
  "Esta novela relata, en mi opinión,\nuna historia de obsesión más que de amor",
  "El libro sigue a través de saltos en el tiempo,\na lo largo de 51 años, la vida de dos personajes principales,\nFlorentino Ariza, quien jura amor eterno y enfermizo a Fermina Daza,\nsu persona de interés amoroso",
  "Este libro, escrito por mi autor favorito\nGabriel García Márquez, publicado en 1986\nlo hizo ganador de un premio Nobel,\n¡Gracias profe por ver!"
};
float textX = 0; // posicionX para desplazamiento
float textY = 30; // posicionY altura texto 
float textSpeed = 0.5; // velocidad desplazamiento

// VARIABLES BOTON
int buttonX = 220;
int buttonY = 360;
int buttonWidth = 200;
int buttonHeight = 80;
boolean showButton = false; // mostrar el boton cuando termine la secuencia

void setup() {
  size(640, 480); // ventana

  // IMAGENES DE DATA
  images = new PImage[4]; 
  images[0] = loadImage("imagen1.jpg");
  images[1] = loadImage("imagen2.jpg");
  images[2] = loadImage("imagen3.jpg");
  images[3] = loadImage("imagen4.jpg");
  
  // TAMAÑO TEXTO
  textSize(30);
}

void draw() {
  background(255); // fondito blanco
  
  // si no estamos en la última imagen, cambiar la imagen según el tiempo
  if (!showButton && millis() - lastChangeTime > imageDuracion) {
    if (currentImage < images.length - 1) {
      currentImage++;
      lastChangeTime = millis(); // actualiza el tiempo de la última vez que se cambió la imagen
      textX = 0; // reinicio la posición del texto
    } else {
      showButton = true; // mostrar boton de la ultima vez q se mostro la ultima imagen
    }
  }
  
  // IMAGEN ACTUAL EN LA VENTANA
  image(images[currentImage], 0, 0, 640, 480);
  
  //texto correspondiente con el efecto 
  fill(255); // color texto (blanquito)
  
  if (currentImage == 0) {
    // efecto de desplazamiento de izquierda a derecha para la primera imagen
    text(textos[currentImage], textX, textY);
    textX += textSpeed;
    if (textX > width) {
      textX = -textWidth(textos[currentImage]);
    }
  } else {
    // efecto de fade para las imágenes 2, 3 y 4
    float alpha;
    if (millis() - lastChangeTime < 3000) {
      alpha = map(millis() - lastChangeTime, 0, 4000, 0, 255); // aparecer gradualmente en 4 segundos
    } else {
      alpha = map(millis() - lastChangeTime, 3000, 4000, 255, 0); // desaparecer en el último segundo
    }
    fill(255, 255, 255, alpha);
    textAlign(CENTER, CENTER);
    text(textos[currentImage], width / 2, height / 2);
    textAlign(LEFT, BASELINE); // restablecer alineación de texto predeterminada
  }
  
  // aparecer botón si la secuencia termino
  if (showButton) {
    fill(100, 100, 255); // color boton azul
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    fill(255); // texto boton color blanquito
    textAlign(CENTER, CENTER);
    text("Reiniciar", buttonX + buttonWidth / 2, buttonY + buttonHeight / 2);
    textAlign(LEFT, BASELINE);
  }
}

void mousePressed() {
  // verificar si el clic está dentro del botón
  if (showButton && mouseX > buttonX && mouseX < buttonX + buttonWidth && mouseY > buttonY && mouseY < buttonY + buttonHeight) {
    // reinicia la secuencia de imágenes
    currentImage = 0;
    lastChangeTime = millis();
    showButton = false;
    textX = 0; // reinicia la posición del texto
  }
}
