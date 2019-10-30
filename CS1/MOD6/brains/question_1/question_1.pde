import java.util.*;

///////////////////////
// Globals
///////////////////////

final int startingSurvivors = 20;

ArrayList<Survivor> people = new ArrayList<Survivor>();
ArrayList<Message> messageList = new ArrayList<Message>();
HashMap<String, Integer> peopleStats = new HashMap<String, Integer>();
String[] maleCSV, femaleCSV;
int maleNameCount, femaleNameCount;

PImage male, maleInjured, female, femaleInjured, infectedI, bG; 

///////////////////////
// Classes
///////////////////////

class Survivor {
    String name;
    final int w = 35;
    final int h = 43;
    int x, y, speed, randomX, randomY;
    boolean injured, infected, female, isDead;
    float direction;

    Survivor(boolean initialSpawn) {
        if (initialSpawn && random(1) <= 0.15) {
            infected = true;
            peopleStats.put("Infected", peopleStats.get("Infected")+1);
        } else if (initialSpawn == false && random(1) <= 0.25) {
            injured = true;
            peopleStats.put("Not Infected", peopleStats.get("Not Infected")+1);
        } else {
            peopleStats.put("Not Infected", peopleStats.get("Not Infected")+1);
        }

        female = halfBoolean();
        x = int(random(1150));
        y = int(random(750));
        direction = int(random(1, 187));

        if (injured) {
            speed = 2;
        } else if (infected) {
            speed = 3;
        } else {
            speed = 4;
        }

        if (female) {
            name = femaleCSV[int(random(1, femaleNameCount))];
        } else {
            name = maleCSV[int(random(1, maleNameCount))];
        }
    }

    boolean halfBoolean() {
        return (random(1) > 0.5);
    }


    Survivor findClosestTarget(boolean lookForInfected) {
        float minDistance = dist(0, 0, width, height);
        Survivor closest = this;
        for (int i = 0; i < people.size(); i ++ ){
            Survivor target = people.get(i);
            if (target.infected == lookForInfected || this == target || target.isDead) continue;
            if (minDistance > min(minDistance, dist(x, y, target.x, target.y))) {
                minDistance = min(minDistance, dist(x, y, target.x, target.y));
                closest = target;
            }
        }
        return closest;
    }

    void moveAwayFromTarget(Survivor target) {
        int crossProduct;
        int nextX = x + int(speed * cos(direction));
        int nextY = y + int(speed * sin(direction));

        if ((dist(x, y, target.x, target.y) < 100)) {
        crossProduct = (nextX - x)*(target.y - y) -
                            (nextY - y)*(target.x - x);
        } else {
            crossProduct = (nextX - x)*(int(random(1000)) - y) -
                            (nextY - y)*(int(random(1000)) - x);
        }
        x = (nextX <= 20 || nextX >= width - 20) ? nextX : (x - nextX) + x;
        y = (nextY <= 30 || nextY >= height - 30) ? nextY : (y - nextY) + y;

        if (random(1) < 0.05) {
            final int angleToTurn = 30;
            if (crossProduct < 0) {
                direction -= radians(angleToTurn
                                    + random(angleToTurn/4)
                                    - angleToTurn/8);
            } else {
                direction += radians(angleToTurn
                                    + random(angleToTurn/4.0f)
                                    - angleToTurn/8.0f);
            }
        }
        correctForBuildAndRoad();

    }

    void moveTowardsTarget(Survivor target) {
        int nextX = x + int(speed * cos(direction));
        int nextY = y + int(speed * sin(direction));

        int crossProduct = (nextX - x)*(target.y - y) -
                        (nextY - y)*(target.x - x);
        
        x = (nextX <= 20 || nextX >= width - 20) ? x : nextX;
        y = (nextY <= 30 || nextY >= height - 30) ? y : nextY;

        correctForBuildAndRoad();


        if (random(1) < 0.2) {
            final int angleToTurn = 30;
            if (crossProduct < 0) {
                direction -= radians(angleToTurn
                                    + random(angleToTurn/4)
                                    - angleToTurn/8);
            } else {
                direction += radians(angleToTurn
                                    + random(angleToTurn/4.0f)
                                    - angleToTurn/8.0f);
            }
        }
    }

    void correctForBuildAndRoad() {
        // bottom left building
        if ((x > 0 && x < 305) && y >= 390) y = 390;
        if ((y > 410 && y < height) && x <= 310) x = 310;

        // bottom right building
        if ((x > 655 && x < width) && y >= 390) y = 390;
        if ((y > 410 && y < height) && x >= 650) x = 650;

        // top right building
        if ((x > 645 && x < width) && y <= 75) y = 75;
        if ((y > 0 && y < 75) && x >= 640) x = 640;


        // left road
        if ((y > 0 && y <= 390) && x <= 30) randomRoad(this);
        // right road
        if ((y > 0 && y < 420) && x >= width - 30) randomRoad(this);
        // top road
        if ((x > 305 && x < 645) && y <= 40) randomRoad(this);
        // bottom road
        if ((x > 305 && x < 655) && y >= height - 40) randomRoad(this);
    }

    void injure() {
        injured = true;
        speed = 2;
        messageList.add(new Message(name + " has been injured!"));
    }

    void infect() {
        infected = true;
        injured = false;
        speed = 3;
        peopleStats.put("Infected", peopleStats.get("Infected")+1);
        peopleStats.put("Not Infected", peopleStats.get("Not Infected")-1);
        messageList.add(new Message(name + " has been INFECTED!"));
    }

    void die() {
        isDead = true;
        peopleStats.put("Infected", peopleStats.get("Infected")-1);
        peopleStats.put("Infected Killed", peopleStats.get("Infected")+1);
    }
}

class Message {
    String content;
    int createdAt;

    Message(String input) {
        content = input;
        createdAt = millis();
    }

    void delete() {
        messageList.remove(this);
    }
}

///////////////////////
// Setup
///////////////////////

void setup() {
    size(1000, 1000);
    frameRate(60);
    peopleStats.put("Infected", 0);
    peopleStats.put("Not Infected", 0);
    peopleStats.put("Infected Killed", 0);

    loadImages();
    loadNames();
    createInitialSurvivors();
}

void loadImages() {
    male = loadImage("male.png");
    male.resize(35, 43);
    maleInjured = loadImage("male_injured.png");
    maleInjured.resize(35, 43);
    female = loadImage("female.png");
    female.resize(35, 43);
    femaleInjured = loadImage("female_injured.png");
    femaleInjured.resize(35, 43);
    infectedI = loadImage("infected.png");
    infectedI.resize(35, 43);
    bG = loadImage("background.jpg");
    bG.resize(1000,1000);
}

void loadNames() {
    maleCSV = loadStrings("male_names.csv");
    femaleCSV = loadStrings("female_names.csv");

    maleNameCount = maleCSV.length -1;
    femaleNameCount = femaleCSV.length -1;
}

void createInitialSurvivors() {
    for (int i = 0; i < startingSurvivors; i++) {
        people.add(new Survivor(true));
    }

    if (peopleStats.get("Infected") == 0) {
        people.get(0).infect();
    }
}

///////////////////////
// Draw
///////////////////////

void draw() {
    drawBackground();
    drawSurvivors();
    moveSurvivors();
    if (frameCount % 5 == 0) checkForContact();
    spawnMore();
    drawScores();
    drawMessages();

    if (peopleStats.get("Infected") == 0) {
        drawFinish();
        noLoop();
    }
}

void drawSurvivors() {
    noStroke();
    rectMode(CENTER);

    for (int i = 0; i < people.size(); i++) {
        PImage drawImage;
        Survivor self = people.get(i);
        if (self.isDead) continue;
        if (self.infected) {
            drawImage = infectedI;
        } else if (self.female) {
            if (self.injured) {
                drawImage = femaleInjured;
            } else {
                drawImage = female;
            }
        } else {
            if (self.injured) {
                drawImage = maleInjured;
            } else {
                drawImage = male;
            }
        }

        image(drawImage, self.x, self.y);
        fill(255);
        if (self.infected == false){
            textAlign(CENTER, CENTER);
            textSize(12);
            text(self.name, self.x, self.y + self.h);
        }
    }
}

void drawScores() {
    int alive = peopleStats.get("Not Infected");
    int infected = peopleStats.get("Infected");
    int killed = peopleStats.get("Infected Killed");


    fill(225);
    textSize(22);
    textAlign(CENTER, CENTER);
    text("Survivors Alive:     " + alive, 130, height - 100);
    text("Survivors Infected   " + infected, 130, height - 60);
    text("Infected Killed      " + killed, 130, height - 20);
}

void drawMessages() {
    fill(225);
    textSize(16);
    textAlign(CENTER, CENTER);

    // int messagePosition = 0;
    // for (int i = messageList.size(); i > 0; i--) {
    //     text(messageList.get(i - 1).content, width - 150, (height - 200)-(messagePosition*20));
    //     if (messageList.get(i - 1).createdAt + 5000 < millis()) messageList.get(i - 1).delete();
    //     messagePosition++;
    // }

    int messagePosition = 0;
    int messageCount = messageList.size();
    while(messageCount > 0) {
        Message message = messageList.get(messageCount - 1);
        text(message.content, width - 150, (height - 20)-(messagePosition*20));
        if (message.createdAt + 5000 < millis()) message.delete();
        messageCount--;
        messagePosition++;
    }
}

void drawBackground() {
    background(bG);
    fill(0, 150);
    rectMode(CORNERS);
    rect(0,0,width,height);
}

void drawFinish() {
    fill(255);
    textSize(48);
    textAlign(CENTER, CENTER);

    text("ALL ZOMBIES ARE DEAD", width/2, height/2);
}

///////////////////////
// Movement and Checks
///////////////////////

void moveSurvivors() {
    if (frameCount % 2 == 0) {
        moveHalf(2);
    } else {
        moveHalf(1);
    }
}

void moveHalf(int evenCheck) {
    int check = (evenCheck % 2 == 0) ? 0 : 1;
    for (int i = 0; i < people.size(); i++) {
        if (i % 2 == check) continue;
        Survivor survivorToMove = people.get(i);
        Survivor closestTarget;
        if (survivorToMove.infected) {
            closestTarget = survivorToMove.findClosestTarget(true);
            survivorToMove.moveTowardsTarget(closestTarget);
            } else {
            closestTarget = survivorToMove.findClosestTarget(false);
            survivorToMove.moveAwayFromTarget(closestTarget);
        }
    }
}

void randomRoad(Survivor self) {
    int randomRoadSelection = int(random(5));

    switch(randomRoadSelection) {
        case 0 :
            self.x = 40;
            self.y = 200;
            self.direction = radians(degrees(90));
        break;
        case 1 :
            self.x = 500;
            self.y = 50;
            self.direction = radians(degrees(180));
        break;
        case 2 :
            self.x = width - 40;
            self.y = 200;
            self.direction = radians(degrees(270));
        break;
        case 3 :
            self.x = 500;
            self.y = height - 50;
            self.direction = radians(degrees(360));
        break;
    }
}

void checkForContact() {
    for (int i = 0; i < people.size(); i++) {
        Survivor self = people.get(i);
        if (self.infected) continue;
        Survivor closestInfected = people.get(i).findClosestTarget(false);
        if (checkCollision(people.get(i), closestInfected)) {
            float randomChance = random(1);
            if (self.injured == false) {
                if (randomChance < 0.3) {
                    self.infect();
                } else if (randomChance > 0.3 && randomChance < 0.5) {
                    self.injure();
                } else if (randomChance > 0.85) {
                    closestInfected.die();
                    messageList.add(new Message(self.name + " killed an infected!"));

                }
            } else {
                if (randomChance < 0.6) {
                    self.infect();
                } else if (randomChance > 0.85) {
                    closestInfected.die();
                    messageList.add(new Message(self.name + " killed an infected!"));
                }
            }
        }
    }
}

boolean checkCollision(Survivor healthy, Survivor infected) {
    return (infected.x > healthy.x - 15 &&
            infected.x < healthy.x + 15 &&
            infected.y < healthy.y + 20 &&
            infected.y > healthy.y - 20);
}

void spawnMore() {
    int notInfectedCount = peopleStats.get("Not Infected");
    int infectedCount = peopleStats.get("Infected");

    if (infectedCount != 0) {
        if ((notInfectedCount * 100)/infectedCount < 20) {
            people.add(new Survivor(false));
            people.add(new Survivor(false));
        }
    }
}
