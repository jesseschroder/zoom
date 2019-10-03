/*
Draw a circle in the output window. Your circle should be moving in some direction
(other than horizontal or vertical) with a constant speed. When your circle hits a wall,
it should bounce off of it in a realistic way and keep moving. For example, the two
screenshots below show the bouncing ball after a few bounces and after many bounces
(you don't have to leave a trail if you don't want to).
*/

/////////////////////
// Global Variables
/////////////////////

final int ballSize = 30;
int ballXSpeed = 7;
int ballYSpeed = 5;
int ballX;
int ballY;

final color ballColour = color(random(50,175), random(50,175), random(50,175));

/////////////////////
// Setup
/////////////////////

void setup() {
    size(800, 700);

    ballX = ballSize;
    ballY = ballSize;
}

/////////////////////
// Drawing stuff
/////////////////////

void draw() {
    caculateSpeed();
    drawBall();
}

void drawBall() {
    stroke(0);
    fill(ballColour);
    background(125);
    circle(ballX, ballY, ballSize);
}

/////////////////////
// Logic
/////////////////////

void caculateSpeed() {
    // x speed
    if (ballX <= width - ballSize/2 &&
        ballX - ballSize/2 >= ballSize/2) {
        ballX = ballX + ballXSpeed;
    } else if (ballX - ballSize/2 < ballSize/2) {
        ballXSpeed = ballXSpeed*-1;
        ballX = ballX + ballXSpeed;
    } else {
        ballXSpeed = ballXSpeed*-1;
        ballX = ballX + ballXSpeed;
    }

    // y speed
    if (ballY <= height - ballSize/2 &&
        ballY - ballSize/2 != 0) {
            ballY = ballY + ballYSpeed;
        } else if (ballY == ballSize/2) {
            ballYSpeed = ballYSpeed*-1;
            ballY = ballY + ballYSpeed;
        } else {
            ballYSpeed = ballYSpeed*-1;
            ballY = ballY + ballYSpeed;
        }
}