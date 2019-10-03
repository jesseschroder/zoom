////////////////////
// Global Variables
////////////////////

color circleColour;
float circleX;
int circleSize;

////////////////////
// Setup
////////////////////

void setup() {
    size(800, 600);
    background(50, 50, 225);

    circleSize = width/20;
}

////////////////////
// Draw the stuff
////////////////////

void draw() {
    circleX = random(0, width);

    if (circleX < width/2) {
        circleColour = color(225, 50, 50);
    }
    else {
        circleColour = color(50, 225, 50);
    }
    
    drawCircle(circleX, circleColour);
}

void drawCircle(float x, color colour) {
    fill(colour);
    stroke(0);

    circle(x, random(0, height), circleSize);
}