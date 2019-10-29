/*
Add a lawn mower to your grass program. The lawn mower can be a box centred about the mouse, and any blade 
of grass under the mower will have its height reduced to some level specified by your code.

Note: if a blade of grass under the mower is shorter than the height of the mower, then that blade of 
grass should not "grow" to the mowed lawn height. Only grass that is tall enough will be changed by the mower.
*/

//////////////////////
// Globals
//////////////////////

final color backgroundColour = color(252, 241, 205);

int grassQuantity = 4000;

Grass[] bladesOfGrass = new Grass[grassQuantity];
Mower mower = new Mower();

PImage mowerImage;

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

class Mower {
    float x;
    float y;
    int w = 75;
    int h = 60;
    float cutHeight = 5;

    void move() {
        x = mouseX;
        y = mouseY;
    }

    boolean onGrass(Grass grassBlade){
        return (grassBlade.x > x - w/2 &&
                grassBlade.x < x + w/2 &&
                grassBlade.y < y + h/2 &&
                grassBlade.y > y - h/2);
    }

    void cutGrass(Grass[] bladesOfGrass) {
        for (int i = 0; i < grassQuantity; i++) {
            if (onGrass(bladesOfGrass[i])) bladesOfGrass[i].h = cutHeight;
        }
    }
 }

//////////////////////
// Setup
//////////////////////

void setup() {
    size(800, 800); 
    mowerImage = loadImage("mower.png");
    mowerImage.resize(92, 72);
    cursor(mowerImage);

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

    mower.move();
    mower.cutGrass(bladesOfGrass);
    drawGrass();
    growGrass();
}

void drawGrass() {
    rectMode(CENTER);
    noStroke();

    for (int i = 0; i < grassQuantity; i++) {
        fill(bladesOfGrass[i].colour);
        rect(bladesOfGrass[i].x, bladesOfGrass[i].y, 5, bladesOfGrass[i].h);
    }
}

void growGrass() {
    for (int i=0; i < grassQuantity; i++) {
        if (bladesOfGrass[i].h < bladesOfGrass[i].maxHeight &&
            mower.onGrass(bladesOfGrass[i]) == false) {
            bladesOfGrass[i].h += random(1);
        }
    }
}
