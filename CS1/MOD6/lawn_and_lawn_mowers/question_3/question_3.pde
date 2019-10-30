/*
Using your Grass class and drawGrass() function, write a program that uses an array and draws a field of grass 
(at least 150 blades of grass with random x and y coordinates in the output window).
*/

//////////////////////
// Globals
//////////////////////

final color backgroundColour = color(252, 241, 205);
final color grassColour = color(50, 180, 50);

int grassQuantity = 4000;

Grass[] bladesOfGrass = new Grass[grassQuantity];

//////////////////////
// Classes
//////////////////////

class Grass {
    float x;
    float y; 
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
    stroke(0);
    fill(grassColour);

    for (int i = 0; i < grassQuantity; i++) {
        rect(bladesOfGrass[i].x, bladesOfGrass[i].y, 5, 20);
    }
}