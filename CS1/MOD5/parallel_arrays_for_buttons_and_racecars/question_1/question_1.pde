/*
For this question, we're going to simulate the concept of having a product image you can hover over to see
the same product from a different angle, or perhaps a different variant. To simplify, we'll use coloured 
rectangles to represent product images, though if you are really keen you can try making it work with images instead!

Draw n rectangles on the output window, all in the same colour to keep it simple. You should be able to change the value of n to anything.

Each rectangle should also have another colour that is associated with it (these alternate colours should be
different for each rectangle). When the mouse is over any rectangle, change the colour of that rectangle 
to its alternate colour. When the mouse leaves the rectangle, its colour should revert back to the original.

You will need to use parallel arrays to solve this problem. This means you will store each attribute of 
the rectangles in a separate array. The index of the arrays indicates which rectangle the data is for. 
In other words, the values at index 0 all refer to the first rectangle, index 1 the second rectangle, etc.
*/

import java.util.Arrays;

////////////////////////
// Global Variables
////////////////////////

final int rectangleCount = 10;
int rectSize, rectWidth, rectY, rectMid;

final color rectRegColour = color(75,75,200);
color[] rectHoverColour = new color[rectangleCount];
color[] rectCurColour = new color[rectangleCount];

color drawColour;

////////////////////////
// Setup
////////////////////////

void settings() {
    size(100*rectangleCount, 100);
}

void setup() {
    background(225);

    rectMode(CENTER);
    rectSize = 80;
    rectWidth = 100;
    rectY = height/2;
    rectMid = rectWidth/2;

    int rectColourCount = 0;

    while (rectColourCount < rectangleCount) {
        rectHoverColour[rectColourCount] = color(random(100, 225), random(100, 225), random(100, 225));
        rectCurColour[rectColourCount] = rectRegColour;
        rectColourCount++;
    }
}

////////////////////////
// Draw
////////////////////////

void draw() {
    whereIsTheMouse();
    int rectDraw = 0;

    while (rectDraw < rectangleCount) {
        drawColour = rectCurColour[rectDraw];

        fill(drawColour);
        square(rectMid + (rectWidth*rectDraw), rectMid, rectSize);
        rectDraw++;
    }
}

////////////////////////
// Mouse stuff
////////////////////////

void whereIsTheMouse() {
    Arrays.fill(rectCurColour, rectRegColour);
    int mouseCount = 0;

    while (mouseCount < rectangleCount) {
        int prodL = 10 + rectWidth*mouseCount; 
        int prodR = 90 + rectWidth*mouseCount;
        int prodT = 10;
        int prodB = 90;
        if (mouseX >= prodL &&
            mouseX <= prodR &&
            mouseY >= prodT &&
            mouseY <= prodB) {
                rectCurColour[mouseCount] = rectHoverColour[mouseCount];
            }
        mouseCount++;
    }
}