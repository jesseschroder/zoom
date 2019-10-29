/*
Modify your Grass class to include two additional fields: a colour (of type color) and a grass height (of type float). 
Draw a field of grass where each blade has a random shade of green and a random height. 
*/

//////////////////////
// Globals
//////////////////////

final color backgroundColour = color(252, 241, 205);

int grassQuantity = 4000;

Grass[] bladesOfGrass = new Grass[grassQuantity];

//////////////////////
// Classes
//////////////////////

class Grass {
    float x;
    float y;
    color colour;
    float h;
}

//////////////////////
// Setup
//////////////////////

void setup() {
    size(800, 800);
    background(backgroundColour);

   generateGrass();
}

void generateGrass() {
    for (int i = 0; i < grassQuantity; i++) {
        bladesOfGrass[i] = new Grass();
        bladesOfGrass[i].x = random(5, width - 5);
        bladesOfGrass[i].y = random(20, height - 20);
        bladesOfGrass[i].colour = color(50, random(125, 255), 50);
        bladesOfGrass[i].h = random(10, 20);
    }
}

//////////////////////
// Drawing
//////////////////////

void draw() {
    drawGrass(bladesOfGrass);
}

void drawGrass(Grass[] bladesOfGrass) {
    rectMode(CENTER);
    noStroke();

    for (int i = 0; i < grassQuantity; i++) {
        fill(bladesOfGrass[i].colour);
        rect(bladesOfGrass[i].x, bladesOfGrass[i].y, 5, bladesOfGrass[i].h);
    }
}