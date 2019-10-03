////////////////////
// Global Variables
////////////////////

color innerColour;
color outerColour;
final color mouseColour = color(125, 50, 50);
final color nonMouseColour = color(50, 50, 125);
int rectWidth;
int rectHeight;

////////////////////
// Setup
////////////////////

void setup() {
    size(800, 600);

    rectWidth = width/2;
    rectHeight = height/2;
}

////////////////////
// Draw the stuff
////////////////////

void draw() {
    if (mouseX >= width/2 - rectWidth/2 &&
        mouseX <= width/2 + rectWidth/2 &&
        mouseY <= height/2 + rectHeight/2 &&
        mouseY >= height/2 - rectWidth/2) {
        innerColour = nonMouseColour;
        outerColour = mouseColour;
    }
    else {
        innerColour = mouseColour;
        outerColour = nonMouseColour;
    }
    
    background(outerColour);
    drawRect(innerColour);
}

void drawRect(color colour) {
    fill(colour);
    noStroke();
    rectMode(CENTER);

    rect(width/2, height/2, rectWidth, rectHeight);
}