/*
Create a Processing program that draws the numbers 1 to 25 horizontally across the screen using the text()
command and a while loop. Make it so odd numbers are drawn in red and even numbers are drawn in blue.
*/

////////////////////////
// Global Variables
////////////////////////

final color oddColour = color(175,50,50);
final color evenColour = color(50,50,175);
final int totalNum = 25;

int spacer;
int xPOS;
color drawColour;


////////////////////////
// Setup
////////////////////////

void setup() {
    background(225);
    size(800, 400);

    spacer = (width - 20*25)/26;
    textSize(18);
    textAlign(CENTER, CENTER);
}

void draw(){
    drawNumbers();
}

void drawNumbers() {
    int drawCount = 1;
    while (drawCount <= 25) {
        drawColour = (drawCount % 2 == 0) ? evenColour : oddColour;
        xPOS = (spacer + 20)*drawCount;
        drawSingleNumber(xPOS, drawCount, drawColour);

        drawCount++;
    }
}

void drawSingleNumber(int x, int number, color colour) {
    fill(colour);
    text(number, x, height/2);
}