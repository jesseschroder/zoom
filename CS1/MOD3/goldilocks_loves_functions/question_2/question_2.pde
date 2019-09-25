/*
  Project is resizable, however odd aspects may make drawings appear strange.
  Due to goldi head being drawn as a circle, this can appear really large on extreme aspect ratio.
*/

// global variables
float bearBodyWidth;
float bearBodyHeight;
float bearHeadHeight;
float bearEarHeight;
float goldiHead;
float goldiBodyHeight;
float goldiBodyWidth;
float xSpace;
float ySpace;

//set up

void setup() {
    size(1000, 800);
    background(220, 240, 220);
    surface.setResizable(true);
}

// draws

void draw() {
    // variable declartions based on size in setup
    bearBodyWidth = width/6;
    bearBodyHeight = height/6;
    bearHeadHeight = height/7;
    bearEarHeight = bearBodyHeight/5;
    goldiHead = (height + width)/20;
    goldiBodyHeight = height/5;
    goldiBodyWidth = width/5;

    // local variable declartions to configure object spacing
    float bearHeight = bearBodyHeight + ((bearHeadHeight - bearBodyHeight) + bearHeadHeight) + bearEarHeight/2;
    float goldiHeight = (goldiBodyHeight + goldiHead/2);

    // object spacing
    xSpace = (width -(bearBodyWidth*3))/4;
    ySpace = (height - (goldiHeight + bearHeight))/3;

    // time to draw
    drawBears();
    drawGoldi();
}

// bears

void drawBears() {
    float bearY = height - ySpace - bearBodyHeight/2;

    //left
    drawOneBear(xSpace + bearBodyWidth/2, bearY);
    // middle
    drawOneBear(width/2, bearY);
    // right
    drawOneBear(width - xSpace - bearBodyWidth/2, bearY);
}

void drawOneBear(float x, float y) {
    float bearEarWidth = bearBodyWidth/5;

    stroke(0);
    fill(160, 82, 45);
    
    // body
    ellipse(x, y, bearBodyWidth, bearBodyHeight);
    // head
    ellipse(x, y - bearHeadHeight, bearBodyWidth/2, bearBodyHeight/1.2);
    // ears
    ellipse(x - bearEarWidth/1.25, y - bearHeadHeight*1.5, bearEarWidth, bearEarHeight);
    ellipse(x + bearEarWidth/1.25, y - bearHeadHeight*1.5, bearEarWidth, bearEarHeight);
}

void drawGoldi() { 
   // body
   fill(200, 130, 130);

   triangle(width/2 - goldiBodyWidth/2,
            ySpace + goldiBodyHeight + goldiHead/2,
            width/2 + goldiBodyWidth/2,
            ySpace + goldiBodyHeight + goldiHead/2,
            width/2,
            ySpace + goldiHead/2);
    
    // head
    fill(250,250,210);

    circle(width/2, ySpace + goldiHead/2, goldiHead);
}
