/*
Imagine you want to visualize your total monthly sales as a merchant using a bar graph.
Write a program that stores monthly total sales for at least 20 months in an array
(you may generate random data points). Draw each data point with a vertical bar, going
up from a horizontal axis (the bars should be evenly spaced horizontally).
*/

///////////////////////
// Global Variables
///////////////////////

final color evenBar = color(175, 50, 50);
final color oddBar = color(50, 50, 175);

float barWidth;
float barDrawWidth;

color barColour;


int[] monthlySales = new int[20];



///////////////////////
// Setup
///////////////////////

void setup() {
    size(1000, 525);
    background(225);

    barWidth = width / 21;
    barDrawWidth = barWidth*0.95;


    int arrayIndex = 0;
    while (arrayIndex < monthlySales.length) {
        monthlySales[arrayIndex] = int(random(250,1000));
        arrayIndex++;
    }
}

///////////////////////
// Draw
///////////////////////


void draw() {
// very basic bar graph. no legend or values added. Purpose of assignment is to use arrays.

    drawGraph();
    drawBars();
}

void drawGraph() {
    fill(0);
    line(barWidth, 0, barWidth, height - barWidth);
    line(barWidth, height - barWidth, width, height - barWidth);
}

void drawBars() {
    int drawIndex = 0;
    while (drawIndex < monthlySales.length) {
        barColour = (drawIndex % 2 == 0) ?  evenBar : oddBar;
        fill(barColour);
        rectMode(CORNERS);

        rect(barWidth + (barWidth*drawIndex),
        height - barWidth - monthlySales[drawIndex]/2,
        barDrawWidth + barWidth + (barWidth*drawIndex),
        height - barWidth);

        drawIndex++;
    }
}