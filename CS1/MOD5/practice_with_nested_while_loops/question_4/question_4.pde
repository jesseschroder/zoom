/* 
Write a program that makes a drawing of a skyscraper. The skyscraper should have at least 20 stories and at least 10 windows per story.
*/

////////////////////////
// Globals
////////////////////////

final color nightSky = color(43, 47, 119);
final color buildingColour = color(75);
final color windowColour = color(225, 225, 153);
final color streetColour = color(140);
final int buildingCount = int(random(5, 12));

final int storyHeight = 20;
final int windowWBuff = 12;
final int windowHBuff = 20;
final int windowH = 12;
final int windowW = 9;

int streetLevel;

////////////////////////
// Setup
////////////////////////

void setup() {
    background(43, 47, 119);
    size(1000, 1000);

    streetLevel = height - 50;

    rectMode(CORNERS);
}

////////////////////////
// Draw
////////////////////////

void draw() {
    drawBuildings();
    drawStreet();
    noLoop();
}

void drawBuildings() {
    int drawCount = 0;

    while(drawCount < buildingCount) {
        drawSkyscrapper();
        drawCount++;
    }
}

void drawSkyscrapper() {
    int floorCount = 1;
    float topFloor = random(22, 50);
    float buildingHeight = topFloor * storyHeight;
    float buildingWidth = windowWBuff*random(12,30);
    float buildingX = random(height - buildingWidth);

    fill(buildingColour);
    rectMode(CORNERS);
    rect(buildingX, (streetLevel - buildingHeight), buildingX + buildingWidth, streetLevel);

    pushMatrix();
    translate(buildingX, streetLevel - buildingHeight);
    while (floorCount < topFloor- 2) {
        int windowCol = 1;
        while (windowCol < buildingWidth/windowWBuff - 2) {
            fill(windowColour);
            rectMode(CENTER);
            rect(windowWBuff + (windowWBuff*windowCol), windowHBuff + (windowHBuff*floorCount), windowW, windowH);
            windowCol++;
        }
    floorCount++;
    }
    popMatrix();
}

void drawStreet() {
    rectMode(CORNERS);
    fill(streetColour);
    rect(0, streetLevel, width, height);
}