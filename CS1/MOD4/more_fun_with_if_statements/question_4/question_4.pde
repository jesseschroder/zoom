/////////////////////
// Global Variables
/////////////////////

final color backgroundColour = color(75, 75, 175);
final color circleColour = color(75, 175, 75);
final color triangleColour = color(175, 75, 75);
final int circleSize = 5;

int point1X, point1Y, point2X, point2Y, point3X, point3Y;


/////////////////////
// Setup
/////////////////////

void setup() {
    size(900, 900);
    background(backgroundColour);

    point1X = -1;
    point2X = -1;
    point3X = -1;
}

/////////////////////
// Drawing
/////////////////////

void draw() {
}

void drawCircle(int x, int y, int size) {
    fill(circleColour);
    noStroke();

    circle(x, y, size);
}

/////////////////////
// Logic
/////////////////////

void mouseClicked() {
    if (point1X == -1) {
        point1X = mouseX;
        point1Y = mouseY;
        drawCircle(point1X, point1Y, circleSize);
    } else if (point2X == -1) {
        point2X = mouseX;
        point2Y = mouseY;
        drawCircle(point2X, point2Y, circleSize);
    }
    else if (point3X == -1) {
        point3X = mouseX;
        point3Y = mouseY;
        drawCircle(point3X, point3Y, circleSize);

        // all 3 points selected, draw the triangle and reset variables. 
        fill(triangleColour);
        triangle(point1X, point1Y, point2X, point2Y, point3X, point3Y);

        point1X = -1;
        point2X = -1;
        point3X = -1;
    }
}

void keyPressed() {
    if (key == ' ') {
        background(backgroundColour);
    }
}