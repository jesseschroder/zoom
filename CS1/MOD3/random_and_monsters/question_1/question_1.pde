// set up

void setup() {
    size(800, 600);
    background(130, 200, 155);
}

// the draw
void draw() {
    frameRate(120);
    drawCircles();
}

// the circle
void drawCircles() {
    noStroke();
    fill(220, 100, 50);
    circle(random(width), random(height), 20);
}
