// setup
void setup() {
     size(600, 600);
     background(0, 100, 0);
     surface.setResizable(true);
}

void draw() {
     float padding = width * 0.0125;
     float rectangleWidth = width/3 - padding*1.5;
     float rectangleTop = height/6;
     float rectangleHeight = height/3;
     
     // rectange
     stroke(0);
     fill(185, 175, 0);

     // left -> right
     rectMode(CORNERS);
     rect(padding,
          rectangleTop,
          rectangleWidth + padding,
          rectangleTop + rectangleHeight);
     rect(width/2 - rectangleWidth/2,
          rectangleTop,
          width/2 + rectangleWidth/2,
          rectangleTop + rectangleHeight);
     rect(width - padding - rectangleWidth,
          rectangleTop,
          width - padding,
          rectangleTop + rectangleHeight);
}