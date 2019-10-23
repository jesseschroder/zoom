

//////////////////////
// Globals
//////////////////////

final color backgroundColour = color(252, 241, 205);
final color grassColour = color(50, 180, 50);
Grass bladeOfGrass = new Grass();

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

    bladeOfGrass.x = random(5, width-5);
    bladeOfGrass.y = random( 10, height-10);
}


//////////////////////
// Drawing
//////////////////////

void draw() {
    drawGrass(bladeOfGrass);
}

void drawGrass(Grass bladeOfGrass) {
    rectMode(CENTER);
    noStroke();
    fill(grassColour);

    rect(bladeOfGrass.x, bladeOfGrass.y, 5, 20);
    }