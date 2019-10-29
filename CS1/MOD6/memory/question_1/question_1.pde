/*
Create a "memory game (Links to an external site.)": make a 4x3 layout of tiles, each of which conceals 
a color. The hidden content has 6 distinct types, which come in pairs (there are two tiles of each type).

Clicking on a tile reveals it; clicking on a second tile reveals that one too. Clicking on a third 
tile reveals it and hides the two previously revealed tiles (that is, only two tiles can be showing at once). 
Clicking on a currently revealed tile has no effect.

Complete the memory game by having the system track the interaction. When two revealed tiles have the 
same color, they remain revealed until the game is over, and the player can continue uncovering more tiles. 
When all tiles are revealed, a message appears stating that the player has won; by clicking, the player 
can begin a new game with a new random layout.

Suggestion: Make a Tile class where each tile has a position, some content, and a boolean recording whether
it's currently revealed or not, and then make an array of Tiles. Also, practice using for loops.

For an extra challenge (only if you have time!): Instead of using simply colors, use small distinct images 
for the tile content. On clicking, use a transition effect instead of simply displaying the tile contents.
*/

import java.util.*;

///////////////////////
// Globals
///////////////////////

final int tilesWide = 4;
final int tilesHigh = 3;
final int tileQuantity = tilesWide * tilesHigh;
int frameCounter;

Tile[] tileSet = new Tile[tileQuantity];

Game game;

///////////////////////
// Classes
///////////////////////

class Tile {
    int x, y;
    int size = 200;

    final color backColour = color(75);
    color[] colourSet = {
        color(175, 50, 50),
        color(50, 175, 50),
        color(50, 50, 175),
        color(175, 175, 50),
        color(50, 175, 175),
        color(175, 50, 175)
    };
    color faceColour;

    boolean revealed, solved;

    Tile(int gridX, int gridY) {
        x = gridX;
        y = gridY;
        faceColour = 100;
    }

    void randomizeColour() {
        for (color randomColour = 0; randomColour == 0;) {
            int colourCount = 0;
            randomColour = colourSet[int(random(6))];
            for (int i = 0; i < tileQuantity; i++) {
                if (tileSet[i].faceColour == randomColour) colourCount +=1;
            }
            if (colourCount < 2) {
                faceColour = randomColour;
            } else {
                randomColour = 0;
            }
        }
    }
}

class Game {
    boolean isWon;
    int[] revealedIndex = new int[2]; 
    int tilesRevealed, tilesSolved;
    HashMap<Integer, Integer> colorMap = new HashMap<Integer, Integer>();
    // Set colorList;
    IntList colorList;
 
    String winText = "You WIN!!!";

    Game() {
        isWon = false;
        tilesRevealed = 0;
        tilesSolved = 0;
        Arrays.fill(revealedIndex, -1);

        colorMap.put(color(175, 50, 50), 0);
        colorMap.put(color(50, 175, 50), 0);
        colorMap.put(color(50, 50, 175), 0);
        colorMap.put(color(175, 175, 50), 0);
        colorMap.put(color(50, 175, 175), 0);
        colorMap.put(color(175, 50, 175), 0);

        createTiles();
        for (int i = 0; i < tileQuantity; i++) {
            tileSet[i].randomizeColour();
        }
    }

    void revealTile(int tileIndex) {
        if (tilesRevealed == 0 ) {
            revealedIndex[0] = tileIndex;
            tileSet[tileIndex].revealed = true;
            tilesRevealed += 1;
        } else if (tilesRevealed == 1) {
            revealedIndex[1] = tileIndex;
            tileSet[tileIndex].revealed = true;
            tilesRevealed += 1;
        }
    }

    void evalutateTiles() {
        if (tileSet[revealedIndex[0]].faceColour == tileSet[revealedIndex[1]].faceColour) {
            tileSet[revealedIndex[0]].solved = true;
            tileSet[revealedIndex[1]].solved = true;
            tilesSolved += 2;
        } else {
            tileSet[revealedIndex[0]].revealed = false;
            tileSet[revealedIndex[1]].revealed = false;
        }
    tilesRevealed = 0;
    Arrays.fill(revealedIndex, -1);
    if (tilesSolved == 12) isWon = true;
    }
}


///////////////////////
// Setup
///////////////////////

void settings() {
    size(tilesWide * 200, tilesHigh * 200);
}

void setup() {
    background(225);
    game = new Game();
}

void createTiles() {
    int tWidth = 200;
    int tHeight = 200;
    for (int count = 0; count < tileQuantity; count++) {
        int x = (count % 4) * tWidth;
        int y = (count / 4) * tHeight;
        tileSet[count] = new Tile(x, y);
    }
}


///////////////////////
// Draw
///////////////////////

    void draw() {
        drawTiles();
        frameRate(30);
        if (game.tilesRevealed == 2) {
            if (frameCounter < 15) {
                frameCounter += 1;
            } else {
                game.evalutateTiles();
                frameCounter = 0;
            }
        }
        if (game.isWon) {
            drawWin();
            noLoop();
        }
    }

    void drawTiles() {

        for (int i = 0; i < tileQuantity; i++) {
            if (tileSet[i].revealed == true ||
                tileSet[i].solved == true) {
                    fill(tileSet[i].faceColour);
                } else {
                    fill(tileSet[i].backColour);
                }
            stroke(20);
            strokeWeight(3);

            square(tileSet[i].x, tileSet[i].y, tileSet[i].size);
            if (tileSet[i].solved == true) {
                fill(255, 100);
                square(tileSet[i].x, tileSet[i].y, tileSet[i].size);
            }
        }
    }

    void drawWin() {
        fill(255, 100);
        rectMode(CORNERS);
        textAlign(CENTER, CENTER);
        textSize(34);

        rect(0, 0, width, height);

        fill(50);
        text(game.winText, width/2, height/2);
    }

///////////////////////
// Mouse
///////////////////////

void mouseClicked() {
    int tileClicked = getTileIndex(mouseX, mouseY);

    if (tileSet[tileClicked].solved == false &&
        tileClicked != game.revealedIndex[0]) {
            game.revealTile(tileClicked);
        }

    if (game.isWon) {
        game = new Game();
        loop();
    }
}

int getTileIndex(int x, int y) {
    int returnIndex = -1;
    int rowNum = 0;
    while (rowNum < tilesHigh) {
        int colNum = 0;
        while (colNum < tilesWide) {
            int currIndex = rowNum*tilesWide + colNum;

            int currX = colNum*200;
            int currY = rowNum*200;

            if (x > currX &&
                x < currX + 200 &&
                y > currY &&
                y < currY + 200) {
                    returnIndex = currIndex;
                    break;
                }
            colNum++;
        }
        rowNum++;
    }
    return returnIndex;
}
