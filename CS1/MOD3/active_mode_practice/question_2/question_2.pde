// variables

int startingPosition = width/4;

// setup
void setup() {
    size(400, 400);
}

// draws

void draw() {
    background(204);
    circle();
}

void circle() {
    startingPosition = startingPosition + 1;
    fill(0);
    circle(startingPosition, height*0.875, 10);
}