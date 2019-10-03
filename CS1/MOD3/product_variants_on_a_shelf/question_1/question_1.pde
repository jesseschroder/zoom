/*
Question 1

Imagine you want to simulate the stocking of a shelf with a number of product variations. Write a program that satisfies the following:

    The program begins by showing an empty shelf.

    You have written a self-contained function that abstracts drawing the product variant. The function will need parameters for the
    x and y position along with at least one other parameter that changes between variants (for example, size or colour). Name your
    function well to indicate what it accomplishes.

    The user can press a number key ('1' through the number of variants) to select the next variant that will appear on the shelf.
     
    When the space key is pressed, a new instance of the currently selected variant appears somewhere randomly along the shelf
    (don't worry if it overlaps with previous variants).
*/

///////////////////
// Global Variants
///////////////////

float productWidth;
float productHeight;
float productSpace;
float firstProductX;
float productY;
float stockedY;
color selectedColor;
final color prod1Color = color(random(100,225), random(100, 225), random(100,225));
final color prod2Color = color(random(100,225), random(100, 225), random(100,225));
final color prod3Color = color(random(100,225), random(100, 225), random(100,225));
final color prod4Color = color(random(100,225), random(100, 225), random(100,225));
final color prod5Color = color(random(100,225), random(100, 225), random(100,225));

final String heading = "Make a selection below by pressing the corrisponding number key.";
final String headingLine2 = "The product can then be stocked on the shelf by pressing space.";


///////////////////
// Set up
///////////////////

void setup() {
    size(800, 800);
    productWidth = width/10;
    productHeight = height/10;

    productSpace = (width*0.8 - productWidth*5)/6;
    firstProductX = width/10 + productSpace + productWidth/2;
    productY = height*0.9 - productHeight/2;
    stockedY = height/2 - productHeight/2;

    rectMode(CENTER);
    background(220);
    drawShelf();
    drawLowerProducts();

    drawHeading();
}

///////////////////
// Draw Stuff
///////////////////

void draw() {
}

void drawHeading() {
    textSize(24);
    fill(0);
    textAlign(CENTER);
    text(heading, width/2, height/6);
    text(headingLine2, width/2, height/5);
}

void drawLowerProducts() {
    // lower product shelf, left to right
    drawSingleProduct(firstProductX, productY, prod1Color);
    drawSingleProduct(firstProductX + productWidth + productSpace, productY, prod2Color);
    drawSingleProduct(firstProductX + productWidth*2 + productSpace*2, productY, prod3Color);
    drawSingleProduct(firstProductX + productWidth*3 + productSpace*3, productY, prod4Color);
    drawSingleProduct(firstProductX + productWidth*4 + productSpace*4, productY, prod5Color);
    
    // numbering products
    fill(0);
    textSize(18);
    textAlign(CENTER,CENTER);
    for (int numberLabel = 1; numberLabel <= 5; numberLabel++ ) {
        text(numberLabel, firstProductX, productY);
        firstProductX = firstProductX + productWidth + productSpace;
    }
    firstProductX = width/10 + productSpace + productWidth/2;

}

void drawShelf() {
    // top
    rectMode(CORNERS);
    fill(139, 69, 19);
    noStroke();

    rect(width/10, height/2, width - width/10, height*0.55);
    
    // bottom
    stroke(170);
    strokeWeight(15);
    line(width/10, height*0.9, width - width/10, height*0.9);
}

void drawSingleProduct(float x, float y, color pcolor) {
    rectMode(CENTER);
    stroke(0);
    strokeWeight(2);
    fill(pcolor);

    rect(x, y, productWidth, productHeight);
}

void selectionHighlight(float x) {
    rectMode(CENTER);
    stroke(255);
    strokeWeight(2);
    fill(100, 75);

    rect(x, productY, productWidth, productHeight);
}

///////////////////
// Key pressing
///////////////////

void keyPressed() {
// each numerical key press will set the product color to draw on the shelf, redraw products (to remove any previous selection), and then draw the highlight

    switch (key) {
        case '1' :
            selectedColor = prod1Color;
            drawLowerProducts();
            selectionHighlight(firstProductX);
        break;
        case '2' :
            selectedColor = prod2Color;
            drawLowerProducts();
            selectionHighlight(firstProductX + productWidth + productSpace);
        break;
        case '3' :
            selectedColor = prod3Color;
            drawLowerProducts();
            selectionHighlight(firstProductX + productWidth*2 + productSpace*2);
        break;		
        case '4' :
            selectedColor = prod4Color;
            drawLowerProducts();
            selectionHighlight(firstProductX + productWidth*3 + productSpace*3);
        break;
        case '5' :
            selectedColor = prod5Color;
            drawLowerProducts();
            selectionHighlight(firstProductX + productWidth*4 + productSpace*4);
        break;
        case ' ' :
            drawSingleProduct(random(width/10 + productWidth/2, width - width/10 - productWidth/2), stockedY, selectedColor);
            drawLowerProducts();
        break;	
    }
}
