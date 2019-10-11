/////////////////////
// Global Variables
/////////////////////

final int circleSize = 20;
final int ringWidth = 100;
final color circleColour = color(75, 75, 190);
final color ringColour = color(190, 75, 75);
float circleX;
float circleY;
float drawDistance;
color drawColour;

/////////////////////
// Set up
/////////////////////

void setup() {
    size(600, 600);
    background(225);
}

/////////////////////
// Logic
/////////////////////

void findVariables() {
    circleX = random(width);
    circleY = random(height);
    drawDistance = dist(circleX, circleY, width/2, height/2);

    if (drawDistance < 150 ||
        drawDistance > 250) {
            drawColour = circleColour;
        } else {
            drawColour = ringColour;
        }
}

/////////////////////
// Drawing
/////////////////////

void draw() {
    findVariables();
    drawCircle(circleX, circleY, circleSize, drawColour);
}

void drawCircle(int x, int y, int size, color colour) {
    noStroke();
    fill(colour);

    circle(x, y, size);
}