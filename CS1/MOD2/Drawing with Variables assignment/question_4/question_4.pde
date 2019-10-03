/////////////////
// setup
/////////////////
float gameX;
float gameY;

/*
Below I'm initializing the "game's" physical dimension
variables. This is essential to use as a global variable
due to the dimensions being used in all of the draw
functions. 

The variables are first set in drawbody, after the canvas
dimensions are set by the set up function. The game size 
is based on the dimensions of the canvas, which make it
somewhat responsive. That said, it's best to keep the same
aspect ratio. 
*/
float gameWidth;
float gameHeight;
float gameTopLineY;

void setup() {
     size(600, 800);
     background(0);
     // surface.setResizable(true); // game screen does not resize vertically properly as it's a square
}

// draw functions

void draw() {
     drawBody();
     drawScreen();
     drawButtons();
     drawSpeaker();    
}

/////////////////
// body
/////////////////

void drawBody() {
     gameX = width/2;
     gameY = height/2;
     gameWidth = width*0.7;
     gameHeight = height*0.8;
     gameTopLineY = gameY - (gameHeight/2)*0.93;
     float gameTop = gameY - gameHeight/2;

     noStroke();
     fill(204, 201, 197);
     rectMode(CENTER);
     rect(gameX, gameY, gameWidth, gameHeight, 5, 5, 50, 5);

     stroke(180, 200);
     strokeWeight(2);
     line(gameX - gameWidth/2, gameTopLineY, gameX + gameWidth/2, gameTopLineY);
     line(gameX - (gameWidth/2)*0.9,
          gameTop,
          gameX - (gameWidth/2)*0.9,
          gameTopLineY);
     line(gameX + (gameWidth/2)*0.9,
          gameTop,
          gameX + (gameWidth/2)*0.9,
          gameTopLineY);
}

/////////////////
// screen
/////////////////

void drawScreen() {
     float gameGlassX = gameX;
     float gameGlassY = gameY - gameHeight/4.2;
     float gameGlassWidth = gameWidth*0.85;
     float gameGlassHeight = gameHeight*0.42;

     fill(160, 158, 163);
     noStroke();
     rect(gameGlassX, gameGlassY, gameGlassWidth, gameGlassHeight, 5, 5, 50, 5);

     fill(139,172,15, 240);
     rect(gameGlassX, gameGlassY, gameWidth/2, gameWidth/2, 3, 3, 3, 3);

     fill(225, 0, 0, 150);
     circle(gameX/2, gameGlassY*0.85, gameWidth*0.02);

     // text

     fill(255);
     textSize(9);
     text("BATTERY", gameX/2.2, gameGlassY*0.93);

     text("DOT MATRIX WITH STEREO SOUND", gameX*0.85, gameTopLineY*1.3);

     // lines

     stroke(170, 54, 105);
     strokeWeight(2);
     line(gameX/2.2,
          gameTopLineY*1.24,
          gameX*0.8,
          gameTopLineY*1.24);

     stroke(44, 48, 134);     
     line(gameX/2.2,
          gameTopLineY*1.3,
          gameX*0.8,
          gameTopLineY*1.3);

     stroke(170, 54, 105);
     line(gameX*1.4,
          gameTopLineY*1.24,
          gameX*1.55,
          gameTopLineY*1.24);

     stroke(44, 48, 134);     
     line(gameX*1.4,
          gameTopLineY*1.3,
          gameX*1.55,
          gameTopLineY*1.3);
}

////////////////
// buttons
/////////////////

void drawButtons() {
     float dPadX = gameX - gameWidth/3.5;
     float dPadY = gameY + gameHeight/6;
     float dPadSpace = (gameWidth/2)/7;
     float aBX = gameX + gameWidth/3.5;
     float aBY = gameY + gameHeight/6;
     float selectX = gameX;
     float selectY = gameY + gameHeight/3;
     float selectWidth = dPadSpace*1.75;
     float selectHeight = dPadSpace/3.8;

     // dpad
     noStroke();
     fill(0);

     beginShape();
     //top
     vertex(dPadX - dPadSpace/2, dPadY - dPadSpace/2);
     vertex(dPadX - dPadSpace/2, dPadY - dPadSpace/2 - dPadSpace);
     vertex(dPadX + dPadSpace/2, dPadY - dPadSpace/2 - dPadSpace);
     vertex(dPadX + dPadSpace/2, dPadY - dPadSpace/2);
     //right
     vertex(dPadX + dPadSpace/2 + dPadSpace, dPadY - dPadSpace/2);
     vertex(dPadX + dPadSpace/2 + dPadSpace, dPadY + dPadSpace/2);
     vertex(dPadX + dPadSpace/2, dPadY + dPadSpace/2);
     //bottom
     vertex(dPadX + dPadSpace/2, dPadY + dPadSpace/2 + dPadSpace);
     vertex(dPadX - dPadSpace/2, dPadY + dPadSpace/2 + dPadSpace);
     vertex(dPadX - dPadSpace/2, dPadY + dPadSpace/2);
     //left
     vertex(dPadX - dPadSpace/2 - dPadSpace, dPadY + dPadSpace/2);
     vertex(dPadX - dPadSpace/2 - dPadSpace, dPadY - dPadSpace/2);
     vertex(dPadX - dPadSpace/2, dPadY - dPadSpace/2);
     endShape();

     fill(40);

     circle(dPadX, dPadY, 20);

     // b / a

     pushMatrix();
     translate(aBX, aBY);
     rotate(radians(-25));
     fill(180, 120);
     rect(0, 0, dPadSpace*4, dPadSpace*1.75, 90, 90, 90, 90);

     fill(170, 54, 105);
     circle(-dPadSpace, 0, dPadSpace*1.5);
     circle(dPadSpace, 0, dPadSpace*1.5);

     fill(44, 48, 134);
     textSize(12);
     text('B', -dPadSpace, dPadSpace*1.5);
     text('A', dPadSpace, dPadSpace*1.5);
     popMatrix();

     // start / select

     pushMatrix();
     fill(125);
     rectMode(CENTER);
     translate(selectX - selectWidth*0.6, selectY);
     rotate(radians(-25));
     rect(0, 0, selectWidth, selectHeight, 70, 70, 70, 70);
     fill(44, 48, 134);
     textSize(11);
     text("SELECT", -selectWidth/3, selectHeight*2);
     popMatrix();

     pushMatrix();
     fill(125);
     rectMode(CENTER);
     translate(selectX + selectWidth/2, selectY);
     rotate(radians(-25));
     rect(0, 0, selectWidth, selectHeight, 70, 70, 70, 70);
     fill(44, 48, 134);
     textSize(11);
     text("START", -selectWidth/3, selectHeight*2);
     popMatrix();
}
////////////////
// speaker
/////////////////

void drawSpeaker() {
     float speakerSpace = gameWidth/17;
     float speakerX = gameX + gameWidth/7 - speakerSpace*0.75;
     float speakerY = gameY + gameHeight*0.42;
     float speakerHeight = (gameHeight/8)*0.75;

     pushMatrix();
     translate(speakerX, speakerY);
     rotate(radians(-25));
     stroke(150);
     strokeWeight(8);
     for (int i = 0; i < 6; i++ ) {
          line(speakerSpace*(i+1), 0, speakerSpace*(i+1), speakerHeight);
     }
     popMatrix();
}
