/*
Make a racing animation.

The animation should have n racing cars that will race across the screen. 
Each car will have an initial speed (randomly chosen). The race should stop
as soon as any car (which can be just a rectangle) reaches the end of the screen.

To make the race more interesting, after every 30 frames (or so), modify each 
car's speed by a random amount. Let this random amount be negative or positive 
(to allow a car to either speed up or slow down). However, the cars should never 
stop or reverse their direction.
*/

////////////////////////
// Globals
////////////////////////

import java.util.Arrays;

PImage carImage;
final int racers = 10;

int carSpace;
int[] carX = new int[racers];
int[] carY = new int[racers];
int[] carSpeed = new int[racers];

boolean raceOver;


////////////////////////
// Setup
////////////////////////

void settings() {
    size(1200, racers*60);
}

void setup() {
    background(225);
    imageMode(CENTER);

    carSpace = 60;
    carImage = loadImage("camaro.png");
    carImage.resize(150, 50);

    Arrays.fill(carX, 75);
    for (int i = 0; i < racers; i++) {
        carY[i] = 25 + carSpace * i;
    }

    setSpeed();
    raceOver = false;
}

////////////////////////
// Drawing
////////////////////////

void draw() {
    background(225);
    drawCars();
    carMovement();

    if (frameCount % 30 == 0) setSpeed();
    if (raceOver == true) noLoop();
}

void drawCars() {
    for(int i = 0; i < racers; i++) {
        image(carImage, carX[i], carY[i]);
    }
}

////////////////////////
// Movement
////////////////////////

void carMovement() {
    for(int i = 0; i < racers; i++) {
        carX[i] = carX[i] + carSpeed[i];
        if (carX[i] + 75 >= width) raceOver = true;
    }
}

void setSpeed(){
    for(int i = 0; i < racers; i++) {
        carSpeed[i] = int(random(5,15));
    }
}