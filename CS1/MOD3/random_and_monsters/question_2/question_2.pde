// global variables

final color background = color(255);
final int headWidth = width;
final int headHeight = height;

color headColor;
int headX;
int headY;


// setup

void setup() {
    size(800, 600);
    rectMode(CENTER);
    headX = width/2;
    headY = height/2;
}

void draw() {
    background(background);
    headColor = color(random(255), random(255), random(255));
    drawMonster(headX, headY, headWidth, headHeight, headColor);
}

void mouseClicked() {
    headX = mouseX;
    headY = mouseY;
}

void drawMonster(int x, int y, int width, int height, color fillColor)
{ 
  final int eyeRadius = 5;
 
  fill(fillColor);
  rect(x, y, width, height);

  // Draw the left ear
  triangle(x - width/4, // x1
           y - height/2, // y1
           x - width/4 - 10, // x2
           y - height/2, // y2
           x - width/4 - 5, //x3
           y - height/2 - 10); //y3
 
  // Draw the right ear
  triangle(x + width/4, // x1
           y - height/2, // y1
           x + width/4 + 10, // x2
           y - height/2, // y2
           x + width/4 + 5, //x3
           y - height/2 - 10); //y3
 
  // Draw the left eye
  ellipse(x - width/5,
          y - height/4,
          eyeRadius * 2,
          eyeRadius * 2);
 
 // Draw the right eye
 ellipse(x + width/5,
         y - height/4,
         eyeRadius * 2,
         eyeRadius * 2);
}
