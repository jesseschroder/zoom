import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

////////////////
// global variables
////////////////

PImage backgroundImage;
PFont buttonFont;

Minim minim;
AudioPlayer song1Player;
AudioPlayer song2Player;
AudioPlayer song3Player;

final int buttonWidth = 30;
final int buttonHeight = 40;
final int buttonY = 100;

int middleButtonX;
int leftButtonX;
int rightButtonX;
int songPlaying;

int buttonCounter;
final int framesBetweenFlash = 60;

////////////////
// set up
////////////////

void setup() {
    backgroundImage = loadImage("Jukebox.jpg");
    surface.setSize(backgroundImage.width, backgroundImage.height);
    minim = new Minim(this);
    song1Player = minim.loadFile("Boreal_forest.mp3");
    song2Player = minim.loadFile("mexico_8bit.mp3");
    song3Player = minim.loadFile("summerCamp.mp3");
    songPlaying = -1;

    middleButtonX = width/2;
    leftButtonX = middleButtonX - buttonWidth/2 - 30;
    rightButtonX = middleButtonX + buttonWidth/2 + 30;

    buttonCounter = 0;

    buttonFont = loadFont("Serif-48.vlw");
    textFont(buttonFont, 48);
    textAlign(CENTER, CENTER);
}

////////////////
// draw
////////////////

void draw(){
    image(backgroundImage, 0, 0);
    fill(240);
    rectMode(CENTER);

    buttonCounter++;
    if (buttonCounter > framesBetweenFlash * 2) {
        buttonCounter = 0;
    }

    drawButton(leftButtonX, buttonY, 1);
    drawButton(middleButtonX, buttonY, 2);
    drawButton(rightButtonX, buttonY, 3);
}

void drawButton(int x, int y, int buttonNumber) {
    if (buttonNumber != songPlaying || buttonCounter < framesBetweenFlash) {
        fill(240);
        rectMode(CENTER);
        
        rect(x, y, buttonWidth, buttonHeight);

        fill(0);
        text(buttonNumber, x, y);
    }
}

////////////////
// music
////////////////

void toggleSong(AudioPlayer songPlayer, int buttonNumber) {
    boolean wasPlaying = songPlayer.isPlaying();
    songPlaying = -1;
    song1Player.pause(); 
    song2Player.pause();
    song3Player.pause();

    if (!wasPlaying) {
        songPlayer.play();
        songPlaying = buttonNumber;
    }
}

////////////////
// mouse
////////////////


void mouseClicked()
{ 
  if (mouseY >= buttonY - (buttonHeight/2) &&
      mouseY <= buttonY + (buttonHeight/2))
  {
    if (mouseX >= leftButtonX - (buttonWidth/2) &&
        mouseX <= leftButtonX + (buttonWidth/2))
    {
      // Left button clicked
      toggleSong(song1Player, 1);
    }
    else if (mouseX >= middleButtonX - (buttonWidth/2) &&
             mouseX <= middleButtonX + (buttonWidth/2))
    {
      // Middle button clicked
      toggleSong(song2Player, 2);
    }
    else if (mouseX >= rightButtonX - (buttonWidth/2) &&
             mouseX <= rightButtonX + (buttonWidth/2))
    {
      // Right button clicked
      toggleSong(song3Player, 3);
    }
  }
}