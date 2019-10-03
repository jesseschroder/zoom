/////////////////
// setup
/////////////////

float artWallX;
float artWallY;
float artWallWidth;
float artWallHeight;

void setup() {
       size(1200, 900);
       background(125);
       surface.setResizable(true); // sign text and bear head & arms do not rezise properly
}

/////////////////
// draw
/////////////////

void draw() {
       drawWall();
       drawFloor();
       drawArtWall();
       drawSign();
       drawCar();
       drawTeddy();
}

// back wall
void drawWall() {
       artWallX = width/2;
       artWallY = height*0.5;
       artWallWidth = width*0.8;
       artWallHeight = height*0.5;

       noStroke();
       fill(0, 200, 0, 150);
       rectMode(CORNERS);
       rect(0, 0, width, artWallY + artWallHeight/2);

       triangle(0,
              artWallY + artWallHeight/2,
              0,
              artWallY + artWallHeight/2 + artWallHeight*0.1,
              width/2 - artWallWidth/2 - artWallWidth/10,
              artWallY + artWallHeight/2);

       triangle(width,
              artWallY + artWallHeight/2,
              width,
              artWallY + artWallHeight/2 + artWallHeight*0.1,
              width/2 + artWallWidth/2 + artWallWidth/10,
              artWallY + artWallHeight/2);
}

/////////////////
// floor
/////////////////

void drawFloor() {
       int floorSpace = width/10;
       float floorTop = (width/2 - artWallWidth/2) + artWallWidth/10;
       int bottomSpace = width/10;

       stroke(0);
       line(width/2 - artWallWidth/2 - artWallWidth/10,
              artWallY + artWallHeight/2,
              width/2 + artWallWidth/2 + artWallWidth/10,
              artWallY + artWallHeight/2);

       for (int i = 0; i < 10; i++ ) {
              line(floorTop, artWallY + artWallHeight/2, bottomSpace*(i+1), height);
              floorTop = floorTop + artWallWidth/10;
       }
       line(0, height, width/2 - artWallWidth/2, artWallY + artWallHeight/2);
}

/////////////////
// art wall
/////////////////

void drawArtWall() {
       // background

       noStroke();
       fill(0, 0, 100, 100);
       rectMode(CENTER);
       rect(artWallX, artWallY, artWallWidth, artWallHeight, 16, 16, 0, 0);

       // shelf

       stroke(0);
       fill(255,235,205);
       rect(artWallX, artWallY*1.2, artWallWidth*0.9, artWallHeight*0.1);
}

/////////////////
// sign
/////////////////

void drawSign() {
       float signWidth = artWallWidth*0.8;
       float signHeight = height * 0.1;
       String sign_text = "Toy Store";
       float poleWidth = width/75;
       float poleHeight = signHeight * 0.75;

       strokeWeight(5);
       fill(235);
       rectMode(CENTER);
       rect(artWallX, height*0.1, signWidth, height * 0.15);

       fill(0, 0, 100, 150);
       textAlign(CENTER, CENTER);
       textSize(48);
       text(sign_text, artWallX, signHeight);

       noStroke();
       fill(50);
       rectMode(CORNERS);
       rect(artWallX - signWidth*0.4,
       0,
       artWallX - signWidth*0.4 + poleWidth,
       poleHeight,
       0, 0, 90, 90);
       rect(artWallX + signWidth*0.4,
       0,
       artWallX + signWidth*0.4 + poleWidth,
       poleHeight,
       0, 0, 90, 90);
}

/////////////////
// toy car
/////////////////

void drawCar() {
       float carWidth = artWallWidth / 4;
       float carHeight = artWallHeight / 10;
       float carX = artWallX/2;
       float carY = artWallY;

       // tires
       fill(0);
       stroke(0);
       circle(carX + carWidth/5,
              carY + carHeight*1.1,
              carHeight/1.5);
       circle(carX + carWidth/1.2,
              carY + carHeight*1.1,
              carHeight/1.5);

       // top
       fill(0, 0, 200, 100);
       stroke(200, 0, 0);
       strokeWeight(10);
       curve(carX,
       carY + height/2,
       carX + carWidth/5,
       carY,
       carX + carWidth / 1.2,
       carY,
       carX,
       carY + height/2);

       // body
       noStroke();
       fill(200, 0, 0);
       rectMode(CORNER);
       rect(carX,
       carY,
       carWidth,
       carHeight,
       90, 90, 90, 90);

       stroke(0);
       strokeWeight(2);
       line(carX + carWidth/1.8, carY, carX + carWidth/1.7, carY - carHeight*1.15);

       // headlights
       noStroke();
       fill(200, 200, 0, 80);
       quad(carX, carY + carHeight/1.8, carX, carY + carHeight/2.2, carX - carWidth/2, carY, carX - carWidth/2, carY + carHeight);
       fill(200, 200, 0);
       ellipse(carX, carY + carHeight/2, carHeight/5, carHeight/3);
}

/////////////////
// teddy 
/////////////////

void drawTeddy() {
       float teddyCircle = artWallHeight / 12;
       float teddyEllipseWidth = artWallWidth / 10;
       float teddyEllipseHeight = teddyEllipseWidth*1.3;
       float teddyX = artWallX*1.35;
       float teddyY = artWallY*1;
       //arms

       // stroke(0);
       // strokeWeight(1);
       fill(160,82,45);

       quad(teddyX - teddyCircle*0.3,
       teddyY - teddyCircle*1,
       teddyX - teddyCircle*0.5,
       teddyY - teddyCircle*1.7,
       teddyX - teddyCircle *2.5,
       teddyY + teddyCircle*0.2,
       teddyX - teddyCircle*2,
       teddyY + teddyCircle
       );

       quad(teddyX + teddyCircle*0.3,
       teddyY - teddyCircle*1,
       teddyX + teddyCircle*0.5,
       teddyY - teddyCircle*1.7,
       teddyX + teddyCircle *2.5,
       teddyY + teddyCircle*0.2,
       teddyX + teddyCircle*2,
       teddyY + teddyCircle
       );

       // body

       noStroke();
       fill(160,82,45);
       ellipseMode(CENTER);
       ellipse(teddyX, teddyY, teddyEllipseWidth, teddyEllipseHeight);

       fill(222,184,135);
       ellipse(teddyX, teddyY*1.04, teddyEllipseWidth*0.7, teddyEllipseHeight*0.6);

       // feet

       stroke(0);
       strokeWeight(1);
       fill(160,82,45);
       circle(teddyX - teddyCircle*0.8,
              teddyY + teddyEllipseHeight/2.5,
              teddyCircle);
       circle(teddyX + teddyCircle*0.8,
              teddyY + teddyEllipseHeight/2.5,
              teddyCircle);

       fill(205,133,63);
       noStroke();
       circle(teddyX - teddyCircle*0.8,
              teddyY + teddyEllipseHeight/2.5,
              teddyCircle*0.65);
       circle(teddyX + teddyCircle*0.8,
              teddyY + teddyEllipseHeight/2.5,
              teddyCircle*0.65);

       // head & ears & face

       stroke(0);
       strokeWeight(1);
       fill(160,82,45);
       circle(teddyX - teddyCircle*0.7,
              teddyY - teddyEllipseHeight*0.8,
              teddyCircle);
       circle(teddyX + teddyCircle*0.7,
              teddyY - teddyEllipseHeight*0.8,
              teddyCircle);

       fill(205,133,63);
       noStroke();
       circle(teddyX - teddyCircle*0.7,
              teddyY - teddyEllipseHeight*0.8,
              teddyCircle*0.65);
       circle(teddyX + teddyCircle*0.7,
              teddyY - teddyEllipseHeight*0.8,
              teddyCircle*0.65);      

       stroke(0);
       fill(160,82,45);
       circle(teddyX, teddyY - teddyEllipseHeight/2.1, teddyCircle*2.3);

       noStroke();
       fill(0);
       circle(teddyX - teddyCircle*0.5,
              teddyY - teddyEllipseHeight*0.6,
              teddyCircle*0.2);
       circle(teddyX + teddyCircle*0.5,
              teddyY - teddyEllipseHeight*0.6,
              teddyCircle*0.2);

       triangle(teddyX,
              teddyY - teddyEllipseHeight*0.4,
              teddyX - teddyCircle*0.25,
              teddyY - teddyEllipseHeight*0.45,
              teddyX + teddyCircle*0.25,
              teddyY - teddyEllipseHeight*0.45);

       stroke(0);
       strokeWeight(2);
       line(teddyX, teddyY - teddyEllipseHeight*0.4, teddyX, teddyY - teddyEllipseHeight*0.35);
       noFill();
       arc(teddyX, teddyY - teddyEllipseHeight*0.39, teddyCircle/2, teddyCircle/2, radians(35), radians(145));
}