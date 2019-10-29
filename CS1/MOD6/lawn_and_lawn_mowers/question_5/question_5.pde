/*
Write a program that shows a field of grass growing. Each blade of grass should start out with height zero 
(each blade of grass is first just a seed in the dirt) and grows over time until its maximum height is reached. 
The maximum height of each blade of grass should be stored in the object so it can be different 
(do you need a new field in the class definition?).

Add a mouseClicked() function that restarts the growing process with each blade of grass with height zero.
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
    float maxHeight;
}

//////////////////////
// Setup
//////////////////////

void setup() {
    size(800, 800); 

    generateGrass();
}

void generateGrass() {
    for (int i = 0; i < grassQuantity; i++) {
        bladesOfGrass[i] = new Grass();
        bladesOfGrass[i].x = random(5, width - 5);
        bladesOfGrass[i].y = random(20, height - 20);
        bladesOfGrass[i].colour = color(50, random(125, 255), 50);
        bladesOfGrass[i].h = 0;
        bladesOfGrass[i].maxHeight = random(12,20);
    }
}

//////////////////////
// Drawing
//////////////////////

void draw() {
    frameRate(30);
    background(backgroundColour);
    drawGrass(bladesOfGrass);
    growGrass();
}

void drawGrass(Grass[] bladesOfGrass) {
    rectMode(CENTER);
    noStroke();

    for (int i = 0; i < grassQuantity; i++) {
        fill(bladesOfGrass[i].colour);
        rect(bladesOfGrass[i].x, bladesOfGrass[i].y, 5, bladesOfGrass[i].h);
    }
}

void growGrass() {
    for (int i=0; i < grassQuantity; i++) {
        if (bladesOfGrass[i].h < bladesOfGrass[i].maxHeight) {
            bladesOfGrass[i].h += random(1);
        }
    }
}

void mouseClicked() {
    for (int i = 0; i < grassQuantity; i++) {
        bladesOfGrass[i].h = 0;
    }
}