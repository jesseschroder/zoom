////////////////////////
// Global Variables
////////////////////////
final int brickCount = 80;

Brick[] brickSet = new Brick[80];
Ball ball = new Ball();
Paddle paddle = new Paddle();
Game game = new Game();

final color redRow = color(175, 75, 75);
final color orangeRow = color(175, 125, 75);
final color yellowRow = color(175, 175, 75);
final color greenRow = color (75, 175, 75);

final String instructions1 = "Controls: Left / Right arrow";
final String instructions2 = "Press Space to Shoot";
final String gameOverText = "GAME OVER";
final String yourScore = "Your Score was: ";
final String startAgain = "Press Space to Play Again.";
final String winText = "YOU WIN!!!!!!";

////////////////////////
// Setup
////////////////////////

void setup() {
    background(175);
    size(1000, 800);

    newBricks();
}

void newBricks() {
    int bWidth = width/10;
    int bHeight = height/20;
    for (int count = 0; count < 80; count++) {
        int x = (count % 10) * bWidth + bWidth / 2;
        int y = (count / 10) * bHeight + bHeight / 2;
        color bColour = brickColour(y);
        brickSet[count] = new Brick(x, y, bWidth, bHeight, bColour);
    }
}

void draw() {
    background(175);
    for (int i = 0; i < 80; i++) {
        brickSet[i].brickDraw();
    }
    
    paddle.padDraw();
    ball.ballDraw();
    if (game.isPaused == false &&
        game.gameOver == false &&
        game.isWon == false) {
        ball.ballMove();
        paddle.move();
    }
    game.draw();

}

color brickColour(int pos) {
    if (pos < height/20*2) {
        return redRow;
    } else if (pos < height/20*4 && pos > height/20*2) {
        return orangeRow;
    } else if (pos < height/20*6 && pos > height/20*4) {
        return yellowRow;
    } else {
        return greenRow;
    }
}

class Brick {
    color brickColour;
    int brickX, brickY, brickWidth, brickHeight, brickL, brickR, brickT, brickB;
    boolean isNotDestroyed;

    Brick(int x, int y, int w, int h, color colour) {
        brickWidth = w;
        brickHeight = h;
        brickX = x;
        brickY = y;
        brickL = brickX - w/2;
        brickR = brickX + w/2;
        brickT = brickY - h/2;
        brickB = brickY + h/2;

        brickColour = colour;
        isNotDestroyed = true;
    }
    
    void brickDraw() {
        if (isNotDestroyed == true) {

            rectMode(CENTER);
            fill(brickColour);

            rect(brickX, brickY, brickWidth, brickHeight, 5);
        }
    }

    void destroy(){
        isNotDestroyed = false;
        game.bricksDestroyed += 1;
        if (game.bricksDestroyed == 4 || game.bricksDestroyed == 12) game.ballSpeedMultiplier +=1;


        if (brickColour == greenRow) {
            game.points += 10;
        } else if (brickColour == yellowRow) {
            game.points += 30;
        } else if (brickColour == orangeRow) {
            game.points += 50;
            if (game.orangeHit == false) {
                game.ballSpeedMultiplier +=1;
                game.orangeHit = true;
            }
        } else if (brickColour == redRow) {
            game.points += 70;
            if (game.redHit == false) {
                game.ballSpeedMultiplier +=1;
                game.redHit = true;
            }
        }
    }
}

class Ball {
    int ballX, ballY, ballSize, ballXSpeed, ballYSpeed, ballL, ballR, ballT, ballB;

    Ball() {
        ballX = 500;
        ballY = 668;
        ballSize = 20;
        ballXSpeed = 2;
        ballYSpeed = -2;
    }

    void ballDraw() {
        ballL = ballX - ballSize/2;
        ballR = ballX + ballSize/2;
        ballT = ballY - ballSize/2;
        ballB = ballY + ballSize/2;
        fill(255);
        stroke(1);

        circle(ballX, ballY, ballSize);
    }

    void ballMove() {
        if (ballL <= 0 || ballR >= width) ballXSpeed = -ballXSpeed;
        if (ballY <= 0) {
            ballYSpeed = -ballYSpeed;
        } else if (paddle.hit(ballB, ballX)) {
            ballYSpeed = -ballYSpeed;
            paddle.hitLocation(ballX);
        }

        for (int i = 0; i < brickCount; i++) {
            if (brickSet[i].isNotDestroyed) {            
                if (leftCheck(i) && rightCheck(i) && topCheck(i) && bottomCheck(i)) {
                    brickSet[i].destroy();
                    ballOffBrick(i);
                }
            }
        }
        ballX = ballX + ballXSpeed * game.ballSpeedMultiplier;
        ballY = ballY + ballYSpeed * game.ballSpeedMultiplier;

        if (ballT >= height) game.death();
    }

    // booleans checks are named for the ball edge

    boolean leftCheck(int brickNum) {
        return ballL < brickSet[brickNum].brickR;
    }
    boolean rightCheck(int brickNum) {
        return ballR > brickSet[brickNum].brickL;
    }
    boolean topCheck(int brickNum) {
        return ballT < brickSet[brickNum].brickB;
    }
    boolean bottomCheck(int brickNum) {
        return ballB > brickSet[brickNum].brickT;
    }

    void ballOffBrick(int brickNum) {
        int brickX = brickSet[brickNum].brickX;
        int brickY = brickSet[brickNum].brickY;

        if (dist(ballX, ballY, brickX, brickY) > 60 && game.recentX == false) {
            ballXSpeed = -ballXSpeed;
            game.recentX = true;
        } else if (dist(ballX, ballY, brickX, brickY) < 60 && game.recentY == false) {
            ballYSpeed = -ballYSpeed;
            game.recentY = true;
        }
    }
}

class Paddle {
    int padX, padY, padWidth, padHeight, padT, padB, padL, padR;
    boolean moveLeft, moveRight;

    Paddle() {
        padX = 500;
        padY = 700;
        padHeight = 30;
        padWidth = 200;
        moveLeft = false;
        moveRight = false;
    }

    void padDraw() {
        padT = padY - padHeight/2;
        padB = padY + padHeight/2;
        padR = padX + 120;
        padL = padX - 120;

        fill(255);
        stroke(1);

        rect(padX, padY, padWidth, padHeight, 90);
    }

    void move() {
        if (moveLeft == true &&
            padX >= 120) {
            padX = padX - 25;
        } else if (moveRight == true &&
            padX <= width - 120) {
            padX = padX + 25;
        }
    }

    boolean hit(int ballB, int ballX){
        return (ballB >= padT &&
                ballB <= padB &&
                ballX <= padR &&
                ballX >= padL);
    }

    void hitLocation(int ballX) {
        int padSection = padWidth/5;
        int halfPad = padSection/2;

        if (ballX >= padX - padSection*2 - halfPad && ballX < padX - padSection - halfPad) {
            ball.ballXSpeed = -4;
        } else if (ballX >= padX - padSection - halfPad && ballX < padX - halfPad) {
            ball.ballXSpeed = -3;
        } else if (ballX >= padX - halfPad && ballX < padX){
            ball.ballXSpeed = -2;
        } else if (ballX == padX) {
            ball.ballXSpeed = 0;
        } else if (ballX > padX && ballX <= padX + halfPad) {
            ball.ballXSpeed = 2;
        } else if (ballX > padX + halfPad && ballX <= padX + padSection + halfPad) {
            ball.ballXSpeed = 3;
        } else if (ballX > padX + padSection && ballX <= padX + padSection*2 + halfPad) {
            ball.ballXSpeed = 4;
        }
    }
}

void keyPressed() {
    if (game.isPaused == false && game.gameOver == false && game.isWon == false) {
        switch (keyCode) {
            case RIGHT :
                paddle.moveRight = true;
            break;
            case LEFT :
                paddle.moveLeft = true;
            break;
            case UP :
                game.isWon = true;
            break;
        }
    } else {
        switch (key) {
            case ' ' :
                if (game.isPaused) {
                game.isPaused = false;
                } else if (game.gameOver || game.isWon) {
                    newBricks();
                    game = new Game();
                }
            break;
        }
    }
}

void keyReleased() {
    if (game.isPaused == false) {
        switch(keyCode) {
            case RIGHT :
                paddle.moveRight = false;
            break;
            case LEFT :
                paddle.moveLeft = false;
            break;
        }
    }
}

class Game {
    int lives, points, bricksDestroyed, ballSpeedMultiplier, xCounter, yCounter;
    boolean isPaused, isWon, gameOver, orangeHit, redHit, recentX, recentY;

    Game(){
        lives = 3;
        points = 0;
        bricksDestroyed = 0;
        ballSpeedMultiplier = 1;

        isPaused = true;
        isWon = false;
        gameOver = false;
        orangeHit = false;
        redHit = false;
    }

    void addPoints(int newPoints){
        points = points + newPoints;
    }

    void draw() {
        drawPoints();
        drawLives();
        // if (brickSet.bricksDestroyed == 80) isWon = true;
        if (recentY) recentY = bounceYCounter();
        if (recentX) recentX = bounceXCounter();
        if (isPaused) pauseScreen();
        if (gameOver) gameOverScreen();
        if (isWon) gameWonScreen();
    }

    boolean bounceYCounter() {
        yCounter = yCounter += 1;
        if (yCounter < 5) {
            return true;
        }
        else {            
            yCounter = 0;
            return false;
        }
    }

    boolean bounceXCounter() {
        xCounter = xCounter += 1;
        if (xCounter < 5) {
            return true;
        }
        else {            
            xCounter = 0;
            return false;
        }
    }

    void drawPoints() {
        fill(255);
        textSize(24);
        textAlign(CORNERS);

        text("SCORE: "+ points, 20, height - 50);
    }

    void drawLives() {
        fill(255);
        textSize(24);
        textAlign(CORNERS);

        text("LIVES: "+ lives, width - 100, height - 50);
    }

    void pauseScreen() {
        rectMode(CORNERS);
        fill(75, 200);

        rect(0,0, width, height);

        fill(200, 75);
        textSize(64);
        textAlign(CENTER, CENTER);
        text(instructions1, width/2, height/3);
        text(instructions2, width/2, height/3 + 100);
    }

    void gameOverScreen() {
        rectMode(CORNERS);
        fill(75, 200);

        rect(0,0, width, height);

        fill(200, 75);
        textSize(64);
        textAlign(CENTER, CENTER);
        text(gameOverText, width/2, height/3);
        textSize(48);
        text(yourScore + points, width/2, height/3 + 100);
        text(startAgain, width/2, height/3 + 150);
    }

    void gameWonScreen() {
        rectMode(CORNERS);
        fill(75, 200);

        rect(0,0, width, height);

        fill(200, 75);
        textSize(64);
        textAlign(CENTER, CENTER);
        text(winText, width/2, height/3);
        textSize(48);
        text(startAgain, width/2, height/3 + 100);
    }

    void death() {
        lives = lives - 1;
        if (lives == 0) {
            gameOver = true;
        } else {
            isPaused = true;
        }
            ball.ballX = 500;
            ball.ballY = 668;
            paddle.padX = 500;
            ball.ballXSpeed = 2;
            ball.ballYSpeed = -2;
            paddle.moveLeft = false;
            paddle.moveRight = false;
    }
}
