/*
Write a program to display ten buttons which can each have one of five possible colours: red, orange, yellow, green, blue.
The colours should be stored in this order in an array. When the user clicks on a button, that button should change to
the next colour in the array, or go back to red if it was blue. Your buttons can be any shape.
*/

final color[] colourList = {
    color(225, 50, 50),
    color(255, 165, 0),
    color(225, 255, 50),
    color(50, 225, 50),
    color(50, 50, 225),
};
color currentColour;

int buttonWidth, buttonBuffer, buttonX, buttonY;
int [] buttonState = new int[10];


void setup() {
    background(225);
    size(700, 500);

    buttonWidth = 40;
    buttonBuffer = 50;
    buttonY = height/2;
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
}

void draw() {
    int buttonCount = 0;
    while (buttonCount < 10) {
        currentColour = colourList[buttonState[buttonCount]];
        fill(currentColour);
        
        square(100 + buttonBuffer*buttonCount, buttonY, buttonWidth);
        fill(0);
        text(buttonCount, 100 + buttonBuffer*buttonCount, buttonY);
        buttonCount++;
    }
}

void keyPressed() {
    switch (key) {
        case '0' :
            buttonState[0] = (buttonState[0] == 4) ? 0 : buttonState[0] + 1;
        break;
         case '1' :
            buttonState[1] = (buttonState[1] == 4) ? 0 : buttonState[1] + 1;
        break;
         case '2' :
            buttonState[2] = (buttonState[2] == 4) ? 0 : buttonState[2] + 1;
        break;
         case '3' :
            buttonState[3] = (buttonState[3] == 4) ? 0 : buttonState[3] + 1;
        break;
         case '4' :
            buttonState[4] = (buttonState[4] == 4) ? 0 : buttonState[4] + 1;
        break;
         case '5' :
            buttonState[5] = (buttonState[5] == 4) ? 0 : buttonState[5] + 1;
        break;
         case '6' :
            buttonState[6] = (buttonState[6] == 4) ? 0 : buttonState[6] + 1;
        break;
         case '7' :
            buttonState[7] = (buttonState[7] == 4) ? 0 : buttonState[7] + 1;
        break;
         case '8' :
            buttonState[8] = (buttonState[8] == 4) ? 0 : buttonState[8] + 1;
        break;
         case '9' :
            buttonState[9] = (buttonState[9] == 4) ? 0 : buttonState[9] + 1;
        break;
    }
}
