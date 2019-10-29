Face face;


void setup() {
    size(800, 800);
    background(225);

    int faceX = int(random(50, width - 50));
    int faceY = int(random(50, height - 50));
    int faceState = int(random(1,4));


    face = new Face(faceY, faceX, faceState);
}

void draw() {
    face.draw();
}



class Face {
    int yLoc;
    int xLoc;
    int happyState;

    Face(int y, int x, int state) {
        yLoc = y;
        xLoc = x;
        happyState = state;
    }

    void draw() {
        String faceText;
        if (happyState == 1) {
            faceText = "Happy";
        } else if (happyState == 2) {
            faceText = "Straight Face";
        } else {
            faceText = "Frowny";
        }

        faceDraw(xLoc, yLoc, faceText);
    }

    void faceDraw(int x, int y, String text) {
        stroke(0);
        fill(175);
        textAlign(CENTER, CENTER);
        textSize(18);

        circle(x, y, 100);
        fill(0);
        text(text, x, y);
    }
}