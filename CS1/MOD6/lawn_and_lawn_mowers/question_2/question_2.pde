/*
Using your Grass class and drawGrass() function, write a new function that draws an n by m grid of blades of grass in the output window.
Your function should have two input parameters (the n and m values).
*/

//////////////////////
// Globals
//////////////////////

final color backgroundColour = color(252, 241, 205);
final color grassColour = color(50, 180, 50);

int bladesWide = 20; //n
int bladesHigh = 20; //m
float bladesX;
float bladesY;

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

    bladesX = (width - (width / bladesWide)) / bladesWide;
    bladesY = (height - (height / bladesHigh)) / bladesHigh;
}

//////////////////////
// Drawing
//////////////////////

void draw() {
    drawGrassField(bladesWide, bladesHigh);
}

void drawGrassField(int n, int m) {
    for (int wideCount = 0; wideCount < n; wideCount++) {
        for(int heightCount = 0; heightCount < m; heightCount++) {
            Grass newGrass = new Grass();
            newGrass.x = bladesX + bladesX*wideCount;
            newGrass.y = bladesY + bladesY*heightCount;
            drawGrass(newGrass);
        }
    }
}

void drawGrass(Grass bladeOfGrass) {
    rectMode(CENTER);
    noStroke();
    fill(grassColour);

    rect(bladeOfGrass.x, bladeOfGrass.y, 5, 20);
}