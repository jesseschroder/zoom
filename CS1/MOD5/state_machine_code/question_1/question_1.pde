/* 
Your job with this question is to implement a program using the state machine you designed previously, incorporating the list of requirements below.
You are welcome to use the starter code as a jumping-off point if you'd like, changing it as needed. 

  • Design your variables and functions carefully so that they are well named and help organize your code effectively
    (look at the sheep example and the starter code for inspiration).
  • Use constant integers to represent the various states your state machine can be in.
  • Change your mouse cursor (Links to an external site.) to an image of a watering can.
  • Feel free to draw the entities on the screen, or just use existing images (for example, via OpenClipart.org (Links to an external site.)).
*/

/////////////////////////
// Globals
/////////////////////////

// cursor
final int wateringCanWidth = 50;
final int wateringCanHeight = 50;

// walker
final float walkerFullSpeed = 4;
final int walkerStateClean = 1;
final int walkerStateDirty = 2;
final int walkerStateALittleDirty = 3;

int walkerState;
float walkerCurrentSpeed;
float walkerDirection = 0;
int walkerX;
int walkerY;
int walkerWidth = 25;
int walkerHeight = 50;

// puddles
int mudPuddleX = 50;
int mudPuddleY = 250;

int cleanPuddleX = 200;
int cleanPuddleY = 200;

int puddleWidth = 100;
int puddleHeight = 20;

//images
PImage wateringCanImage;
PImage walkerCleanImage;
PImage walkerHalfImage;
PImage walkerDirtyImage;

/////////////////////////
// Setup
/////////////////////////

void setup()
{
  size(500,500);
  imageMode(CENTER);
  
  walkerX = width/2;
  walkerY = height/2;
  walkerCurrentSpeed = walkerFullSpeed;
  walkerState = walkerStateClean;
  
  // Walker images
  walkerCleanImage = loadImage("clean.png");
  walkerCleanImage.resize(walkerWidth, walkerHeight);
  walkerDirtyImage = loadImage("dirty.png");
  walkerDirtyImage.resize(walkerWidth, walkerHeight);
  walkerHalfImage = loadImage("half-dirty.png");
  walkerHalfImage.resize(walkerWidth, walkerHeight);
  
  // Mouse image
  wateringCanImage = loadImage("watering-can.png");
  wateringCanImage.resize(wateringCanWidth, wateringCanHeight);
  cursor(wateringCanImage);
}

/////////////////////////
// Drawing
/////////////////////////

void draw()
{
  background(255);
  
  drawDirtyPuddle(mudPuddleX, mudPuddleY);
  drawCleanPuddle(cleanPuddleX, cleanPuddleY);
  drawWalker(walkerX, walkerY);
  
  checkState();
  moveWalker();
}


void drawCleanPuddle(int x, int y)
{
  stroke(0);
  fill(255);
  ellipse(x, y, puddleWidth, puddleHeight);
}
 
 
void drawDirtyPuddle(int x, int y)
{
  noStroke();
  fill(200);
  ellipse(x, y, puddleWidth, puddleHeight);
}


void drawWalker(int x, int y) {
  if (walkerState == walkerStateClean) {
    drawCleanWalker(x, y);
  } else if (walkerState == walkerStateDirty) {
    drawDirtyWalker(x, y);
  } else if (walkerState == walkerStateALittleDirty) {
    drawHalfDirtyWalker(x, y);
  }
}

// drawing walker states
void drawCleanWalker(int x, int y) {
  image(walkerCleanImage, x, y);
  walkerCurrentSpeed = walkerFullSpeed;
}

void drawDirtyWalker(int x, int y) {
  image(walkerDirtyImage, x, y);
  walkerCurrentSpeed = walkerFullSpeed/2;
}

void drawHalfDirtyWalker(int x, int y) {
  image(walkerHalfImage, x, y);
  walkerCurrentSpeed = walkerFullSpeed*3/4;
}

/////////////////////////
// Mouse Logic
/////////////////////////

void mousePressed() {
  if (clickedOnWalker() && walkerState == walkerStateDirty) {
    walkerState = walkerStateALittleDirty;
  } else if (clickedOnWalker() && walkerState == walkerStateALittleDirty) {
    walkerState = walkerStateClean;
  }
}

boolean clickedOnWalker() {
  return (mouseX <= walkerX + walkerWidth/2 &&
      mouseX >= walkerX - walkerWidth/2 &&
      mouseY <= walkerY + walkerHeight/2 &&
      mouseY >= walkerY - walkerHeight/2);
}

/////////////////////////
// Puddle Check
/////////////////////////

void checkState() {
  if (inMud()) {
    walkerState = walkerStateDirty;
  } else if (inPuddle()) {
    walkerState = walkerStateClean;
  }
}

boolean inMud() {
  return (leftSide(mudPuddleX) && topSide(mudPuddleY) && bottomSide(mudPuddleY) ||
      rightSide(mudPuddleX) && topSide(mudPuddleY) && bottomSide(mudPuddleY) ||
      topSide(mudPuddleY) && leftSide(mudPuddleX) && rightSide(mudPuddleX) ||
      bottomSide(mudPuddleY) && leftSide(mudPuddleX) && rightSide(mudPuddleX));
}

boolean inPuddle() {
  return (rightSide(cleanPuddleX) && topSide(cleanPuddleY) && bottomSide(cleanPuddleY) ||
      leftSide(cleanPuddleX) && topSide(cleanPuddleY) && bottomSide(cleanPuddleY) ||
      topSide(cleanPuddleY) && leftSide(cleanPuddleX) && rightSide(cleanPuddleX) ||
      bottomSide(cleanPuddleY) && leftSide(cleanPuddleX) && rightSide(cleanPuddleX));
}

/////////////////////////
// Walker Proximity Check
/////////////////////////

boolean leftSide(int pudX) {
  return ((walkerX - walkerWidth/2) < (pudX + puddleWidth/2) &&
      (walkerX - walkerWidth/2) > (pudX - puddleWidth/2));
}

boolean rightSide(int pudX) {
  return ((walkerX + walkerWidth/2) > (pudX - puddleWidth/2) &&
      (walkerX + walkerWidth/2) < (pudX + puddleWidth/2));
}
boolean topSide(int pudY) {
  return ((walkerY - walkerHeight/2) < (pudY + puddleHeight/2) &&
      (walkerY - walkerHeight/2) > (pudY - puddleHeight/2));
}
boolean bottomSide(int pudY) {
  return ((walkerY + walkerHeight/2) > (pudY - puddleWidth/2) &&
      (walkerY + walkerHeight/2) < (pudY + puddleWidth/2));
}

/////////////////////////
// Walker Movement
/////////////////////////

void moveWalker()
{
  // Now we will update the walker's direction...
  int nextX = walkerX + int(walkerCurrentSpeed * cos(walkerDirection));
  int nextY = walkerY + int(walkerCurrentSpeed * sin(walkerDirection));

  // Check cross product to determine whether we need
  // to go left or right
  int crossProduct = (nextX - walkerX)*(mouseY - walkerY) -
                     (nextY - walkerY)*(mouseX - walkerX);
                 
  // Finished using both sets of coordinates so we can
  // go ahead and update the walker's location
  walkerX = nextX;
  walkerY = nextY;
  
  // 5% of the time, we'll turn left or right toward the mouse
  if (random(1) < 0.05)
  {
    final int angleToTurn = 30;
    if (crossProduct < 0) // turn left (would be right if y was up)
    {
      walkerDirection -= radians(angleToTurn 
                                + random(angleToTurn/4) 
                                - angleToTurn/8);
    }
    else // turn right (would be left if y was down)
    {
      walkerDirection += radians(angleToTurn 
                                + random(angleToTurn/4) 
                                - angleToTurn/8);
    }
  }
}
