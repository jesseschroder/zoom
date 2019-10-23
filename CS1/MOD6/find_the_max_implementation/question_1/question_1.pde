/*
    Create a new array of ten integers and fill the array with random numbers between 1 and 20 (inclusive).
    Find the index of the largest value in the array. If there is more than one, record the index of the first instance.
    Draw a series of evenly spaced rectangles on the screen. Label each rectangle with the corresponding random number in the array. (Extra: make the rectangles' heights be proportional to how big the random number is.)
    Highlight the rectangle that corresponds with the maximum number in another colour.
*/

int numberOfNumbers = 10;
int[] randoArray = new int[numberOfNumbers];

int highestValue = 0;
int highestValueIndex;

int rectangleSize = 80;
int rectangleSpace = 100;
int rectangeX = 50;

void settings() {
    int dynamicWidth = rectangleSpace * numberOfNumbers;
    size(dynamicWidth, 300);
}

void setup() {
    background(225);

    for (int i = 0; i < numberOfNumbers; i++) {
        randoArray[i] = int(random(1,20));
    }

    findHighestValue();
}

void findHighestValue() {
    for (int i = 0; i < numberOfNumbers; i++) {
        if (randoArray[i] > highestValue) {
            highestValue = randoArray[i];
            highestValueIndex = i;
        }
    }
}

void draw() {
    rectangles();
    numbers();
}

void rectangles() {
    fill(225);
    strokeWeight(10);
    rectMode(CENTER);

    for (int i = 0; i < numberOfNumbers; i++) {
        if (i == highestValueIndex) {
            stroke(75, 225, 75);
        } else {
            stroke(0);
        }
        square(rectangeX + (rectangleSpace*i), height/2, rectangleSize);
    }
}

void numbers() {
    fill(0);
    textSize(24);
    textAlign(CENTER, CENTER);

    for (int i = 0; i < numberOfNumbers; i++) {
        text(i, rectangeX + (rectangleSpace * i), height/2);
    }
}