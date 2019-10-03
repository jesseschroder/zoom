/*
Draw a rectangle somewhere on the screen. Create a ball that moves in a straight horizontal line,
ensuring that the ball’s path will cross that of the rectangle. When the ball hits the rectangle,
it should bounce and start moving in the opposite direction. Similarly, if the ball hits the edge
of the screen, it should bounce.
*/

/////////////////////
// Global Variables
/////////////////////

final int ballSize = 30;
int ballSpeed = 5;
int ballX;
int boxWidth;
int boxHeight;
int boxEdge;

final color ballColour = color(random(50,175), random(50,175), random(50,175));


/////////////////////
// Setup
/////////////////////

void setup() {
    size(800, 700);
    
    boxWidth = width/4;
    boxHeight = height/2;
    boxEdge = width*3/4 - boxWidth/2;
    ballX = ballSize;
}

/////////////////////
// Drawing stuff
/////////////////////

void draw() {
    background(125);
    drawBox(boxWidth, boxHeight);
    caculateSpeed();
    drawBall();
}

void drawBox(int w, int h) {
    rectMode(CENTER);
    noStroke();
    fill(175, 80, 80); 

    rect(width*3/4, height/2, w, h);
}

void drawBall() {
    stroke(0);
    fill(ballColour);

    circle(ballX, height/2, ballSize);
}

/////////////////////
// Logic
/////////////////////

void caculateSpeed() {
    if (ballX <= boxEdge - ballSize/2 &&
        ballX - ballSize/2 != 0) {
        ballX = ballX + ballSpeed;
    } else if (ballX - ballSize/2 == 0) {
        ballSpeed = ballSpeed*-1;
        ballX = ballX + ballSpeed;
    } else {
        ballSpeed = ballSpeed*-1;
        ballX = ballX + ballSpeed;
    }
}