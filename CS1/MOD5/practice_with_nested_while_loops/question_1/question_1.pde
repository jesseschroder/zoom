/* 
Draw a 2x2 checker board. Have a yellow background and red/black squares that do not overlap or touch.  You should draw all 4 rectangles in your picture. 
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
    numSquares = 2;
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
