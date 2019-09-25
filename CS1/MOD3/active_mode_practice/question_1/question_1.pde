// variables

int startingPosition = width/4;

// setup
void setup() {
    size(400, 400);
    background(204);
}

// draws

void draw() {
    circle();
}

void circle() {
    startingPosition = startingPosition + 1;
    fill(0);
    circle(startingPosition, height/8, 10);
}