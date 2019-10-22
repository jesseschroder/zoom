/*
------------------------------------
Simple Character AI
------------------------------------

This program was created by Gail Carmichael for 
COMP 1405: Introduction to Computer Science 1.
It introduces Strings, while loops, and arrays.
 
The idea is partially inspired by a pet sheep
many of us had on our desktops in the 90's: 
http://www.youtube.com/watch?v=xPNAxHrYGrs
 
*/


PImage sheepImage;
PImage sheepTeaImage;

int sheepX;
int sheepY;
float sheepDirection; // in radians
int sheepState;

final int sheepSpeed = 3;
final int sheepMouseThreshold = 50;
final int sheepStateWander = 1;
final int sheepStateStop = 2;
final int sheepStateColors = 3;

final int circleShift = 40;

final color[] listOfColors =
{
  color(227, 41, 41), // red
  color(214, 122, 224), // purple
  color(115, 111, 234), // blue
  color(83, 216, 97), // green
  color(252, 255, 95), // yellow
  color(211, 133, 15), // brown
  color(175, 202, 216), // blue 
};

final int numFramesToShiftColor = 10;
int colorStartIndex;

// Stuff that gets done just once at the beginning
// of the program. Set up values that either need
// initial settings or that you know won't ever
// need to change.
void setup()
{
  size(500,500);
  
  sheepImage = loadImage("lemmling_Cartoon_sheep.png");
  sheepTeaImage = loadImage("Teeschaf.png");
  imageMode(CENTER);
  
  sheepX = width/2;
  sheepY = height/2;
  sheepDirection = 187;
  sheepState = sheepStateWander;
  colorStartIndex = 0;
}


// This functions gets called once a "frame" if you
// look at the program like an animation.  Processing
// draws things at a certain framerate, which dictates
// how many "frames per second" are drawn.
void draw()
{
  background(255);
  updateSheepState();
  drawSheep();
  moveSheep();
}

void drawRings(int x, int y, int radiusChange, color[] colors, int startIndex)
{
  float maxDistance = max(dist(x, y, 0, 0), dist(x, y, 0, height));
  maxDistance = max(maxDistance, dist(x, y, width, 0));
  maxDistance = max(maxDistance, dist(x, y, width, height));

 
  float radius = maxDistance;
  int colorIndex = startIndex;
  while (radius > 0)
  {
    fill(colors[colorIndex]);
    colorIndex = (colorIndex + 1);
    if (colorIndex >= colors.length) // past the end? start again!
    {
      colorIndex = 0;
    }
  
    ellipse(x, y, 2*radius, 2*radius);
    radius -= radiusChange;
  }
}

// This function checks whether the sheep should be changing
// state.  Since I am not passing in any parameters,
// this isn't the most portable function - but it does
// help organize the code.
void updateSheepState() {
  if (sheepState == sheepStateWander) {
    if (dist(mouseX, mouseY, sheepX, sheepY) >= sheepMouseThreshold) {
      sheepState = sheepStateWander;
    } else {
      sheepState = sheepStateStop;
    }
  } else if (sheepState == sheepStateStop) {
    if (dist(mouseX, mouseY, sheepX, sheepY) >= sheepMouseThreshold) {
      sheepState = sheepStateWander;
    } else if (mousePressed) {
      sheepState = sheepStateColors;
    }
  } else if (sheepState == sheepStateColors) {
    if (!mousePressed) {
      sheepState = sheepStateStop;
      } else if (frameCount % numFramesToShiftColor == 0)
  {
    colorStartIndex = colorStartIndex + 1;
    if (colorStartIndex >= listOfColors.length)
    {
      colorStartIndex = 0;
    }
  }
  }
}


// This function draws the sheep based on its current
// state.
void drawSheep() {
  if (sheepState == sheepStateWander) {
    image(sheepImage, sheepX, sheepY);
  } else {
    if (sheepState == sheepStateColors) {
      drawRings(sheepX, sheepY, circleShift, listOfColors, colorStartIndex);
    }
    image(sheepTeaImage, sheepX, sheepY);
  }
}


// This function checks the sheep's current state and
// moves its location if appropriate.
void moveSheep() {
  if (sheepState == sheepStateWander) {
    int nextX = sheepX + int(sheepSpeed * cos(sheepDirection));
    int nextY = sheepY + int(sheepSpeed * sin(sheepDirection));

    int crossProduct = (nextX - sheepX)*(mouseY - sheepY) -
                      (nextY - sheepY)*(mouseX - sheepX);
  
    if (dist(nextX, nextY, mouseX, mouseY) > 25)
    {
      sheepX = nextX;
      sheepY = nextY;
    }

    if (random(1) < 0.05)
    {
      final int angleToTurn = 30;
      if (crossProduct < 0)
      {
        sheepDirection -= radians(angleToTurn 
                          + random(angleToTurn/4) 
                          - angleToTurn/8);
      }
      else
      {
        sheepDirection += radians(angleToTurn 
                          + random(angleToTurn/4.0f) 
                          - angleToTurn/8.0f);
      }
    }
  }
}

 
 
