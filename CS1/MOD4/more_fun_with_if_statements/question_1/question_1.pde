/*
Your program for this question will be a simple animation of a circle that changes colour. These are the requirements:

    A circle will be drawn, starting at the top middle of the window.

    Over time, the circle will move toward the bottom of the screen without leaving a trail.

    Appropriate variables will be used to keep track of the colour and location of the circle.

    The colour of the circle will change slowly over time (you’ll want to adjust it only a small amount every frame).

    When the circle reaches the bottom of the screen, it should bounce back up, but every time it bounces it should
     go half as far up as the last time.

    In other words, the first time it bounces, it would go to the top of the screen again; the second time, it would
     go halfway up; the third time, a quarter of the way up, and so on.

Hint: Consider keeping track of the max height the circle should reach after every bounce at the bottom, and if the circle is moving upwards, check whether that max height has been reached yet.
*/

/////////////////////
// Global Variables
/////////////////////

final int ballSize = 80;
int ballRed;
int ballGreen;
int ballBlue;
int redMod = 2;
int greenMod = 2;
int blueMod = -2;

int ballY;
int ballSpeed;
int ballBounce;
int bounceHeight;

/////////////////////
// Setup
/////////////////////

void setup() {
    size(700, 800);
    
    ballY = ballSize/2;
    ballRed = 170;
    ballGreen = 0;
    ballBlue = 95;

    bounceHeight = ballSize/2;
    ballBounce = 0;
    ballSpeed = 5;
}

/////////////////////
// Logic
/////////////////////

void colorRotation() {
    // red
    if (ballRed >= 255 ||
        ballRed <= 0) {
        redMod = redMod * -1;
        ballRed = ballRed + redMod;
    } else {
        ballRed = ballRed + redMod;
    }
    // green
    if (ballGreen >= 200 ||
        ballGreen <= 0) {
        greenMod = greenMod * -1;
        ballGreen = ballGreen + greenMod;
    } else {
        ballGreen = ballGreen + greenMod;
    }
    //blue
    if (ballBlue >= 255 ||
        ballBlue <= 0) {
        blueMod = blueMod * -1;
        ballBlue = ballBlue + blueMod;
    } else {
        ballBlue = ballBlue + blueMod;
    }
}

void ballHeight() {

    // protect from "divide by 0" on first drop

    if (ballBounce != 0) {
        bounceHeight = height - (height / ballBounce);
    }

    // when ball gets to the bottom switch directions and change vars for lower bounce

    if (ballY >= height - ballSize/2) {
        ballSpeed = ballSpeed * -1;
        if (ballBounce == 0) {
            ballBounce = 1;
        } else {
            ballBounce = ballBounce * 2;
        }
    } else if (ballY < bounceHeight) {
        ballSpeed = ballSpeed * -1;
    }

    ballY = ballY + ballSpeed;
}

/////////////////////
// Drawing
/////////////////////

void draw() {
    frameRate(120);
    background(220);
    colorRotation();
    ballHeight();
    drawBall();

    // stop the drawing once the ball reaches the bottom. Otherwise ballBounce hits limit and resets to 0
    if (bounceHeight == height) {
        noLoop();
    }
}

void drawBall() {
    fill(ballRed, ballGreen, ballBlue);
    noStroke();
    ellipseMode(CENTER);

    circle(width/2, ballY, ballSize);
}