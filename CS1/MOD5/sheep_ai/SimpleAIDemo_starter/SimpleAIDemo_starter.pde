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

final int sheepSpeed = 3;

final int sheepMouseThreshold = 50;


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


// This function checks whether the sheep should be changing
// state.  Since I am not passing in any parameters,
// this isn't the most portable function - but it does
// help organize the code.
void updateSheepState()
{
  // TODO
}


// This function draws the sheep based on its current
// state.
void drawSheep()
{
  image(sheepImage, sheepX, sheepY);
}


// This function checks the sheep's current state and
// moves its location if appropriate.
void moveSheep()
{
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

 
 
