final int numCircles = 50;

int[] circleX = new int[numCircles];
float[] circleY = new float[numCircles];
float[] circleSpeed = new float[numCircles];

final int initialY = 20;


void setup()
{
  size(500,500);
  int circleNum = 0;
  while (circleNum < numCircles)
  {
   circleX[circleNum] = (int)random(width);
   circleY[circleNum] = initialY;
   circleSpeed[circleNum] = random(1,5);
 
   circleNum++;
  }
}

void draw()
{
  background(255);
 
  int circleNum = 0;
  while (circleNum < numCircles)
  {
   ellipse(circleX[circleNum], circleY[circleNum], 10, 10);
   circleY[circleNum] += circleSpeed[circleNum];
   circleNum++;
  }
}