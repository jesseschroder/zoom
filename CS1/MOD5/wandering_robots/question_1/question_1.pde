/*
There will be one beacon in the program. It will be drawn as a simple circle and can be clicked on and dragged around the screen with the mouse.

There will also be two "robots." Represent each robot as a circle, as well as a single line from the centre of the circle to the edge.
The line should be drawn in the direction the robot is currently heading.

The robots will have wandering behaviour such that they generally head toward the beacon, even if the beacon is moving.
Like the sheep, the robots should turn toward their targets about 5% of the time, and have some random error in how much they turn.

When a robot reaches a beacon, it will stop and rest for 3 seconds. After 3 seconds, the robot should continue wandering toward the beacon,
if the beacon has moved (otherwise it just rests again).
*/
final int robotSpeed = 3;
final int robotMouseThreshold = 50;

int robot1X;
int robot1Y;
float robot1Direction;
int robot1TimeOfBeacon = 0;

int robot2X;
int robot2Y;
float robot2Direction;
int robot2TimeOfBeacon = 0;

int robotDiameter = 20;

int beaconX;
int beaconY;
int beaconDiameter = 30;
boolean beaconDragged = false;

void setup()
{
  size(500,500); 
 
  robot1X = 50;
  robot1Y = 50;
  robot1Direction = 0;
  
  robot2X = 250;
  robot2Y = 250;
  robot2Direction = 200;
  
  beaconX = 150;
  beaconY = 150;
}


void draw() {
    frameRate(50);
  background(255);
  
  drawRobot(robot1X, robot1Y, robot1Direction, robotDiameter);
  drawRobot(robot2X, robot2Y, robot2Direction, robotDiameter);
  
  drawBeacon(beaconX, beaconY, beaconDiameter);  
  
//   if (robot1TimeOfBeacon < 0 || millis() - robot1TimeOfBeacon > 3000)
    moveRobot1();
  
//   if (robot2TimeOfBeacon < 0 || millis() - robot2TimeOfBeacon > 3000)
    moveRobot2();
}


void drawRobot(int x, int y, float dir, int diam) {
    fill(0, 0);
    stroke(3);

    circle(x, y, diam);
    pushMatrix();
    translate(x, y);
    rotate(dir);
    line(0, 0, diam/2, 0);
    popMatrix();
}


void drawBeacon(int x, int y, int size) {
    fill(175, 85, 85);
    stroke(0);

    circle(x,y, size);
}


void moveRobot1() {
    int nextX = robot1X + int(robotSpeed * cos(robot1Direction));
    int nextY = robot1Y + int(robotSpeed * sin(robot1Direction));

    int crossProduct = getCrossProduct(nextX, nextY, robot1X, robot1Y);

    if (dist(nextX, nextY, beaconX, beaconY) > 20 &&
        (robot1TimeOfBeacon == 0 || robot1TimeOfBeacon > 3000)) {
        robot1X = nextX;
        robot1Y = nextY;
        robot1Direction += getAngleToTurn(crossProduct);
        robot1TimeOfBeacon = 0;
    } else {
        robot1TimeOfBeacon += 20;
    }
    

}

void moveRobot2() {
    int nextX = robot2X + int(robotSpeed * cos(robot2Direction));
    int nextY = robot2Y + int(robotSpeed * sin(robot2Direction));

    int crossProduct = getCrossProduct(nextX, nextY, robot2X, robot2Y);

    if (dist(nextX, nextY, beaconX, beaconY) > 20 &&
        (robot2TimeOfBeacon == 0 || robot2TimeOfBeacon > 3000)) {
        robot2X = nextX;
        robot2Y = nextY;
        robot2Direction += getAngleToTurn(crossProduct);
        robot2TimeOfBeacon = 0;
    } else {
        robot2TimeOfBeacon += 20;
    }
    
}

int getCrossProduct(int nextX, int nextY, int robotX, int robotY) {
  return (nextX - robotX)*(beaconY - robotY) - // 199 * 99
         (nextY - robotY)*(beaconX - robotX);
}

float getAngleToTurn(int crossProduct) {
  final int angleToTurn = 30;
  if (random(1) < 0.05)
  {
    float angleToTurnWithRandomness = 
        radians(angleToTurn + random(angleToTurn/4.0f)  - angleToTurn/8.0f);
        
    if (crossProduct < 0)
    {
      return -angleToTurnWithRandomness;
    }
    else
    {
      return angleToTurnWithRandomness;
    }
  }
  return 0;
}

void mouseDragged() {
    if (mouseX <= beaconX + beaconDiameter/2 &&
        mouseX >= beaconX - beaconDiameter/2 &&
        mouseY <= beaconY + beaconDiameter/2 &&
        mouseY >= beaconY - beaconDiameter/2) {
            beaconX = mouseX;
            beaconY = mouseY;
        }
}
