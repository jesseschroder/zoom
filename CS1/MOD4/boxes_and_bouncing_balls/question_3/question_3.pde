/*
Draw three boxes, each with a different colour, on the screen. Each box should have one letter (text) written inside
the box, "A", "B" and "C". When you press one of the keys a, b or c, the colour of the box with that letter in it
should change to another colour. When you press the same key the colour of that box should return to its original colour.
*/

/////////////////////
// Global Variables
/////////////////////

final int boxSize = 100;
final color box1Color = color(125, 70, 70);
final color box2Color = color(70, 125, 70); 
final color box3Color = color(70, 70, 125); 
final color box1SelectedColor = color(245, 70, 70);
final color box2SelectedColor = color(70, 245, 70);
final color box3SelectedColor = color(70, 70, 245);

color box1CurrentColor;
color box2CurrentColor;
color box3CurrentColor;


/////////////////////
// Setup
/////////////////////

void setup() {
    size(800, 500);
    background(150);

    box1CurrentColor = box1Color;
    box2CurrentColor = box2Color;
    box3CurrentColor = box3Color;
}

/////////////////////
// Drawing stuff
/////////////////////

void draw() {
    // left
    drawBox(width/4, 'A', box1CurrentColor);
    // mid
    drawBox(width/2, 'B', box2CurrentColor);
    // right
    drawBox(width*3/4, 'C', box3CurrentColor);
}

void drawBox(int x, char boxLetter, color boxColor) {
    fill(boxColor);
    stroke(0);
    rectMode(CENTER);
    textSize(28);
    textAlign(CENTER, CENTER);

    square(x, height/2, boxSize);
    fill(0);
    text(boxLetter, x, height/2);

    
}
/////////////////////
// Logic
/////////////////////

void keyPressed() {
    switch (key) {
        case 'a' :
            box1CurrentColor = (box1CurrentColor == box1Color) ? box1SelectedColor : box1Color;
        break;
        case 'b' :
            box2CurrentColor = (box2CurrentColor == box2Color) ? box2SelectedColor : box2Color;
        break;
        case 'c' :
            box3CurrentColor = (box3CurrentColor == box3Color) ? box3SelectedColor : box3Color;
        break;
    }
}
