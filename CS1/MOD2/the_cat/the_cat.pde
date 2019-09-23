// Set up
size(500, 500);

int catHeadX = 200;
int catHeadY = 300;
int catHeadWidth = 90;
int catHeadHeight = 110;
int catEarWidth = 15;
int catEarOffset = 10;

int catBodyX = catHeadX + 50;
int catBodyY = catHeadY + 100;
int catBodyWidth = 150;
int catBodyHeight = 120;




// Background
noStroke();
fill(0, 0, 255, 60);
rectMode(CORNERS);
rect(0, 0, width, 325);
fill(0, 255, 0, 60);

rect(0, 325, width, height);

// Sun
stroke(0);
strokeWeight(2);
fill(255, 255, 0, 150);
circle(80, 80, 100);

///////////////////
// Cat
///////////////////

// body
stroke(0);
fill(220, 175, 35);
ellipse(catBodyX, catBodyY, catBodyWidth, catBodyHeight);

ellipse(catBodyX + catBodyWidth/2.5,
        catBodyY - catBodyHeight/2.5,
        20, 45);
        
// head

ellipse(catHeadX, catHeadY, catHeadWidth, catHeadHeight);
triangle(catHeadX - catHeadWidth/4,
         catHeadY - catHeadHeight/2 + catEarOffset - catEarWidth, // 240
         catHeadX - catHeadWidth/3,
         catHeadY - catHeadHeight/2 + catEarOffset*3 - catEarWidth,
         catHeadX - catHeadWidth/3 + catEarWidth,
         catHeadY - catHeadHeight/2 + catEarOffset*3 - catEarWidth);
triangle(catHeadX + catHeadWidth/4,
         catHeadY - catHeadHeight/2 + catEarOffset - catEarWidth, // 240
         catHeadX + catHeadWidth/3,
         catHeadY - catHeadHeight/2 + catEarOffset*3 - catEarWidth,
         catHeadX + catHeadWidth/3 - catEarWidth,
         catHeadY - catHeadHeight/2 + catEarOffset*3 - catEarWidth);
         

// feet

stroke(0);
fill(220, 175, 35);

ellipse(catBodyX - catBodyWidth/3,
       catBodyY + catBodyHeight/2 -5,
       20, 20);
ellipse(catBodyX - catBodyWidth/5,
        catBodyY + catBodyHeight/2,
        20, 20);
ellipse(catBodyX + catBodyWidth/3,
        catBodyY + catBodyHeight/2 -5,
        20, 20);
ellipse(catBodyX + catBodyWidth/5,
        catBodyY + catBodyHeight/2,
        20, 20);
