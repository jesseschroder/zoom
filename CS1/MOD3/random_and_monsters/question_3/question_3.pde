// global variables

final color background = color(255);
color monColor;
float monX;
float monY;
float monWidth;
float monHeight;

// setup

void setup() {
    size(800, 600);
    rectMode(CENTER);
    mouseClicked();
    surface.setResizable(true);
    print("i've been setup");
}

// randomization of the variables

void randomVariables() {
    monColor = color(random(255), random(255), random(255));
    monX = random(width);
    monY = random(height);
    monWidth = random(width/20, width/2);
    monHeight = random(height/20, height/2);
}

// do the drawing

void draw() {
}

// mouse clicking funciton
void mouseClicked() {
    background(background);    

    for (int i = 0; i < 3; i++) {
        randomVariables();
        drawMonster(monX, monY, monWidth, monHeight, monColor);
    }
}

// scary mosnster

void drawMonster(float x, float y, float width, float height, color fillColor)
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
