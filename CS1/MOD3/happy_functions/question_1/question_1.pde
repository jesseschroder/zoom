// variables

// set up

void setup() {
    size(500, 350);
    background(14, 8, 200);
    smooth();
}
 // draw

void draw() {
    happy(width/2, height/2);
    happy(width/4, height/2);
    happy(width/2, height/4);
}

// function

void happy(float x, float y) {
    stroke(0);
    strokeWeight(3);
    fill(200, 200, 0);
    circle(x, y, 110);

    fill(0);
    circle(x - 20, y - 20, 20);
    circle(x + 20, y - 20, 20);

    arc(x, y + 10,50,50,0,PI);
}
