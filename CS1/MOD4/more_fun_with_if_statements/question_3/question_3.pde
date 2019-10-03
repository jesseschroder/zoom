final int circleSize = 100;
int circleX;
int circleY;
PImage logo;

void setup()
{
  size(500, 400);

  ellipseMode(CENTER);
  imageMode(CENTER);

  circleX = width/2;
  circleY = height/2;

  logo = loadImage("Shopify-512.png");
  logo.resize((int)(0.6*circleSize), 0);
}

void draw()
{
  background(240);
  
  fill(200);
  noStroke();
  ellipse(circleX, circleY, circleSize, circleSize);
  
  image(logo, circleX, circleY);
}

void mouseDragged() {
    if (mouseX <= circleX + circleSize/2 &&
        mouseX >= circleX - circleSize/2 &&
        mouseY <= circleY + circleSize/2 &&
        mouseY >= circleY - circleSize/2) {
          circleX = mouseX;
          circleY = mouseY;
        }

    if (mouseX <= circleSize/2) {
      circleX = circleSize/2;
    } else if (mouseX >= width - circleSize/2) {
      circleX = width - circleSize/2;
    }
    if (mouseY <= circleSize/2) {
      circleY = circleSize/2;
    } else if (mouseY >= height - circleSize/2) {
      circleY = height - circleSize/2;
    }
}