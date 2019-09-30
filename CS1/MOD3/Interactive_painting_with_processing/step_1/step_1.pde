
// variables

final color redColor = color(240,0,0);
final color greenColor = color(0,240,0);
final color blueColor = color(0,0,240);
final int paintRadius = 50;

color currentColor;

// set up

void setup() {
    size(500, 500);
    background(255);

    noStroke();

    currentColor = redColor;
    fill(currentColor);
}

void draw() {
}
void keyPressed() {
    switch(key) {
        case 'b':
            currentColor = blueColor;
        break;
        case 'g':
            currentColor = greenColor;
        break;
        case 'r':
            currentColor = redColor;
        break;
        case ' ':
            background(255);
        break;
        default :
            currentColor = redColor;
        break;
    }   
    fill(currentColor);
    
}

void mouseDragged() {
    fill(currentColor);
    ellipse(mouseX, mouseY, paintRadius, paintRadius);
}