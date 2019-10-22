/* 
Repeat the previous problem, but have a variable numSquares at the start of your sketch and use nested while loops.
Your checkerboard should have numSquares rows and numSquares columns, and you should draw all
numSquares * numSquares rectangles. Your checker board for numSquares = 8 and 20 
*/

////////////////////////
// Globals
////////////////////////

final color blackSquare = color(0);
final color redSquare = color(245, 30, 30);
final color background = color(245, 245, 30);

int drawColour;
int numSquares;
int squareSpaceWidth;
float squareWidth;

////////////////////////
// Setup
////////////////////////

void setup() {
    background(background);
    size(800, 800);
    rectMode(CORNER);
    numSquares = 20;
    squareSpaceWidth = width/numSquares;
    squareWidth = squareSpaceWidth*0.95;
}

////////////////////////
// Drawing
////////////////////////

void draw() {
    drawGrid();
}

void drawGrid() {
    int rowCount = 0;
    while (rowCount < numSquares) {
        int colCount = 0;

        while (colCount < numSquares) {
            drawColour = ((colCount + rowCount) % 2 == 0) ? redSquare : blackSquare;
            drawSquare(squareSpaceWidth*rowCount, squareSpaceWidth*colCount, drawColour);
            colCount++;
        }
        rowCount++;
    }
}

void drawSquare(int x, int y, color colour) {
    fill(colour);
    square(x, y, squareWidth);
}