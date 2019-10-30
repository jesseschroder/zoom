/*
Significantly less code is used for sorting an array of objects rather than parallel arrays.
Objects should also be used anyways.
*/

size(500,500);
background(255);

class Ball {
    int x, y, size;

    Ball(int ballX, int ballY, int ballSize) {
        x = ballX;
        y = ballY;
        size = ballSize;
    }
}

final int numberOfBalls = 5;
Ball[] ballSet = new Ball[numberOfBalls];

for (int i = 0; i < numberOfBalls; i++) {
    ballSet[i] = new Ball(int(random(20, 400)), int(random(20, 400)), int(random(20,100)));
}
 


////
// Sort the balls by size

int outerIndex = 1;
while (outerIndex < ballSet.length) {
    int innerIndex = outerIndex;
    while (innerIndex > 0 &&
    ballSet[innerIndex].size < ballSet[innerIndex - 1].size) {
        int sizeToLeft = ballSet[innerIndex].size;

        ballSet[innerIndex].size = ballSet[innerIndex - 1].size;
        ballSet[innerIndex - 1].size = sizeToLeft;

        innerIndex--;
    }
    outerIndex++;
}


////
// Draw the array of balls (reuse ballNum variable)

textAlign(CENTER, CENTER);

int ballNum = 0;
while (ballNum < ballSet.length)
{
  Ball ball = ballSet[ballNum];
  fill(200);
  ellipse(ball.x, ball.y, ball.size, ball.size);

  fill(0);
  text(ballNum, ball.x, ball.y);
  
  ballNum++;
}