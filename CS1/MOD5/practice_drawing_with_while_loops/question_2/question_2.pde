/*
Write a function definition that takes in an integer n as a parameter. The function will divide the screen into n vertical bars,
whose colours will alternate between black and white. The function must not use any global variables.
*/

void setup() {
    background(225);
    size(500,500);
}

void draw() {
    int lineCount = 50;
    drawLines(lineCount);
}

void drawLines(int n) {
    int rectCount = 0;
    int rectWidth = width/n;
    rectMode(CORNERS);
    
    while (rectCount < n) {
        color fillColour = (rectCount % 2 == 0) ? color(255) : color(0);
        int rectX = rectWidth * rectCount;
        fill(fillColour);

        rect(rectX, 0, rectX + rectWidth, height);

        rectCount++;
    }
}
