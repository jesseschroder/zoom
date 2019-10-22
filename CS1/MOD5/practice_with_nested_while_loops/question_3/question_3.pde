/*
Write a program that displays the times tables in a grid, from 1x1 up to 9x9. Make sure the gridlines are also showing.
The grid must have 10 rows and 10 columns of the correct values (the first row and column will show the numbers
being multiplied). Nested while loops must be used to create it.
*/

////////////////////////
// Globals
////////////////////////

int division;

////////////////////////
// Setup
////////////////////////

void setup() {
    background(225);
    size(800, 800);
    division = width/10;
    textSize(18);
    textAlign(CENTER, CENTER);
}

////////////////////////
// Draw
////////////////////////

void draw() {
    grid();
    legend();
    multiplication();
}

void grid() {
    fill(125);
    strokeWeight(3);
    int rowCount = 0;
    while (rowCount < 9 ) {
        line(division + (division*rowCount), 0, division + (division*rowCount), height);
        line(0, division + (division*rowCount), width, division + (division*rowCount));
        rowCount++;
    }
}

void legend() {
    fill(50, 50, 180);
    for (int i = 0; i < 10; i++) {
        text(i, division/2 + (division*i), division/2);
        text(i, division/2, division/2 + (division*i));
    }
}

void multiplication() {
    int rowNum = 1;
    fill(0);
    while (rowNum < 10) {
        int colNum = 1;
        while (colNum < 10) {
            text(rowNum*colNum, division/2 + (division*rowNum), division/2 + (division*colNum));
            colNum++;
        }
    rowNum++;
    }
}
