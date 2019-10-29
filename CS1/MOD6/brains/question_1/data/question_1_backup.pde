/*
Create a Survivor class; a survivor will have a name, a location on the screen, an "infected" boolean, an "injured" boolean, 
and a number of bullets carried. Add more data if you think it is warranted.

Create an array of survivors and draw them on the screen (ellipses with names as labels are sufficient, and the names can 
simply be unique numbers); draw them colour-coded to indicate whether they are healthy, infected, or injured. Choose a certain 
percentage of the survivors to be infected to begin with.

You want to know how viable your population of survivors is. Write two functions that take the array of survivors as the parameter:

 •   one will return a percentage of survivors who are completely healthy among all the survivors
 •   the other will return the number of bullets in the possession of healthy survivors

Write code that calls both of these functions and draws the numbers with appropriate labels.

Add movement to your simulation using a similar wandering movement used for the sheep in the simple AI demo. 
The infected should slowly wander toward the closest of the non-infected survivors. The healthy and injured should wander away 
from the closest infected, with the healthy moving more quickly than the injured. You can adjust several of the values used for 
the sheep to adjust the wandering behaviour.

Write a function called checkCollision that takes two survivor objects and returns a boolean. The function should return true 
if the two survivors are touching or overlapping, but false otherwise. Hint: Since both survivor objects are ellipses, an easy 
way to determine a collision is to check if the distance between the centres of the two ellipses is less than the sum of the two radii.

Use your function to check for collisions between survivors every frame. If an infected survivor is touching a healthy survivor, 
the healthy survivor should become infected 30% of the time. On the other hand, if an infected survivor touches an injured 
survivor, the injured survivor should become infected 60% of the time.

Use your function from above to check the percentage of healthy survivors every frame. If the percentage gets lower than 20%, 
reinforcements will be called in to help your shrinking group — 2 new non-infected survivors will spawn, and there will be a 25% 
chance they will be injured.

You should make sure to set the various speeds of your survivors such that the simulation plays out slowly enough to observe 
what is happening. Adjusting the window size, the number of survivors, and the chance of a survivor being infected at the beginning, 
can also influence the speed of the simulation.

If you have time, try to find a sweet spot for the above values, such that the simulation results in the infected winning about 
half the time (by keeping the healthy population well below 20%) and the humans winning about half the time (by running off the 
screen away from all of the infected and keeping the healthy population at least 20%).
*/

import java.util.*;

///////////////////////
// Globals
///////////////////////

final int startingSurvivors = 20;

ArrayList<Survivor> people = new ArrayList<Survivor>();
HashMap<String, Integer> peopleStats = new HashMap<String, Integer>();

PImage male, maleInjured, female, femaleInjured, infectedI, bG; 

///////////////////////
// Classes
///////////////////////

class Survivor {
    final String[] maleList = {"Jake", "Randy", "Kevin", "Robert", "John"};
    final String[] femaleList = {"Sarah", "Amanda", "Becky", "Ronda", "Jane"};
    String name;
    final int w = 35;
    final int h = 43;
    int x, y, speed, randomX, randomY;
    boolean injured, infected, female, isDead;
    float direction;


    Survivor(boolean initialSpawn) {
        if (initialSpawn && random(1) <= 0.1) {
            infected = true;
            injured = false;
            peopleStats.put("Infected", peopleStats.get("Infected")+1);
        } else if (initialSpawn == false && random(1) <= 0.25) {
            infected = false;
            injured = true;
            peopleStats.put("Not Infected", peopleStats.get("Not Infected")+1);
        } else {
            peopleStats.put("Not Infected", peopleStats.get("Not Infected")+1);

        }

        female = halfBoolean();    
        isDead = false;

        x = int(random(1150));
        y = int(random(750));
        randomX = int(random(1150));
        randomY = int(random(750));
        direction = random(100,200);

        if (injured) {
            speed = 2;
        } else if (infected) {
            speed = 3;
        } else {
            speed = 4;
        }

        if (female) {
            name = femaleList[int(random(5))];
        } else {
            name = maleList[int(random(5))];
        }


    }

    boolean halfBoolean() {
        return (random(1) > 0.5);
    }

    // abstract 2 functions below
    Survivor findClosestInfected() {
        float minDistance = dist(0, 0, width, height);
        Survivor closest = this;
        for (int i = 0; i < people.size(); i ++ ){
            if (people.get(i).infected == false || this == people.get(i) || people.get(i).isDead) continue;
            if (minDistance > min(minDistance, dist(x, y, people[i].x, people[i].y))) {
                minDistance = min(minDistance, dist(x, y, people[i].x, people[i].y));
                closest = people[i];
            }
        }
        return closest;
    }

    Survivor findClosestNotInfected() {
        float minDistance = dist(0, 0, width, height);
        Survivor closest = this;
        for (int i = 0; i < people.length; i ++ ){
            if (people[i].infected || this == people[i]) continue;
            if (minDistance > min(minDistance, dist(x, y, people[i].x, people[i].y))) {
                minDistance = min(minDistance, dist(x, y, people[i].x, people[i].y));
                closest = people[i];
            }
        }
        return closest;
    }

    void injure() {
        injured = true;
        speed = 2;
    }

    void infect() {
        infected = true;
        injured = false;
        speed = 3;
        peopleStats.put("Infected", peopleStats.get("Infected")+1);
        peopleStats.put("Not Infected", peopleStats.get("Not Infected")-1);
    }

    void die() {
        isDead = true;
        peopleStats.put("Infected", peopleStats.get("Infected")-1);
    }
}

///////////////////////
// Setup
///////////////////////

void setup() {
    size(1000, 1000);
    frameRate(60);

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

    peopleStats.put("Infected", 0);
    peopleStats.put("Not Infected", 0);

    createInitialSurvivors();
}

void createInitialSurvivors() {
    for (int i = 0; i < startingSurvivors; i++) {
        people.add(i) = new Survivor(true);
    }
}

///////////////////////
// Draw
///////////////////////

void draw() {
    background(bG);
    fill(0, 150);
    rectMode(CORNERS);
    rect(0,0,width,height);
    drawSurvivors();
    moveSurvivors();
    if (frameCount % 5 == 0) checkForContact();

    spawnMore();

    // drawScores();
}

void drawSurvivors() {
    noStroke();
    rectMode(CENTER);

    for (int i = 0; i < people.length; i++) {
        PImage drawImage;
        if (people[i].isDead) continue;
        if (people[i].infected) {
            drawImage = infectedI;
        } else if (people[i].female) {
            if (people[i].injured) {
                drawImage = femaleInjured;
            } else {
                drawImage = female;
            }
        } else {
            if (people[i].injured) {
                drawImage = maleInjured;
            } else {
                drawImage = male;
            }
        }

        image(drawImage, people[i].x, people[i].y);
        fill(255);
        textAlign(CENTER, CENTER);
        textSize(12);
        text(people[i].name, people[i].x, people[i].y + people[i].h);
    }
}

void moveSurvivors() {
    if (frameCount % 2 == 0) {
        moveHalf(2);
    } else {
        moveHalf(1);
    }
}

void moveHalf(int evenCheck) {
    int check = (evenCheck % 2 == 0) ? 0 : 1;
    for (int i = 0; i < people.length; i++) {
        if (i % 2 == check) continue;
        Survivor closest;
        if (people[i].infected) {
            closest = people[i].findClosestNotInfected();
            moveTowards(people[i], closest);
            } else {
            closest = people[i].findClosestInfected();
            moveAway(people[i], closest);
        }
    }
}

// abstract 2 functions below
void moveTowards(Survivor self, Survivor target) {
    int nextX = self.x + int(self.speed * cos(self.direction));
    int nextY = self.y + int(self.speed * sin(self.direction));

    int crossProduct = (nextX - self.x)*(target.y - self.y) -
                    (nextY - self.y)*(target.x - self.x);
    
    self.x = (nextX <= 20 || nextX >= width - 20) ? self.x : nextX;
    self.y = (nextY <= 30 || nextY >= height - 30) ? self.y : nextY;

     buildingsAndRoads(self);


    if (random(1) < 0.2) {
        final int angleToTurn = 30;
        if (crossProduct < 0) {
            self.direction -= radians(angleToTurn
                                + random(angleToTurn/4)
                                - angleToTurn/8);
        } else {
            self.direction += radians(angleToTurn
                                + random(angleToTurn/4.0f)
                                - angleToTurn/8.0f);
        }
    }
}

void moveAway(Survivor self, Survivor target) {
    
    
    int crossProduct;
    int nextX = self.x + int(self.speed * cos(self.direction));
    int nextY = self.y + int(self.speed * sin(self.direction));

    if ((dist(self.x, self.y, target.x, target.y) < 100)) {
       crossProduct = (nextX - self.x)*(target.y - self.y) -
                        (nextY - self.y)*(target.x - self.x);
    } else {
        crossProduct = (nextX - self.x)*(int(random(1000)) - self.y) -
                        (nextY - self.y)*(int(random(1000)) - self.x);
    }
    self.x = (nextX <= 20 || nextX >= width - 20) ? nextX : (self.x - nextX) + self.x;
    self.y = (nextY <= 30 || nextY >= height - 30) ? nextY : (self.y - nextY) + self.y;

    if (random(1) < 0.05) {
        final int angleToTurn = 30;
        if (crossProduct < 0) {
            self.direction -= radians(angleToTurn
                                + random(angleToTurn/4)
                                - angleToTurn/8);
        } else {
            self.direction += radians(angleToTurn
                                + random(angleToTurn/4.0f)
                                - angleToTurn/8.0f);
        }
    }
    buildingsAndRoads(self);

}

void buildingsAndRoads(Survivor self) {
    // bottom left building
    if ((self.x > 0 && self.x < 305) && self.y >= 390) self.y = 390;
    if ((self.y > 410 && self.y < height) && self.x <= 310) self.x = 310;

    // bottom right building
    if ((self.x > 655 && self.x < width) && self.y >= 390) self.y = 390;
    if ((self.y > 410 && self.y < height) && self.x >= 650) self.x = 650;

    // top right building
    if ((self.x > 645 && self.x < width) && self.y <= 75) self.y = 75;
    if ((self.y > 0 && self.y < 75) && self.x >= 640) self.x = 640;


    // left road
    if ((self.y > 0 && self.y <= 390) && self.x <= 30) randomRoad(self);
    // right road
    if ((self.y > 0 && self.y < 420) && self.x >= width - 30) randomRoad(self);
    // top road
    if ((self.x > 305 && self.x < 645) && self.y <= 40) randomRoad(self);
    // bottom road
    if ((self.x > 305 && self.x < 655) && self.y >= height - 40) randomRoad(self);
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
    for (int i = 0; i < people.length; i++) {
        if (people[i].infected) continue;
        Survivor closestInfected = people[i].findClosestInfected();
        if (checkCollision(people[i], closestInfected)) {
            float randomChance = random(1);
            if (people[i].injured == false) {
                if (randomChance < 0.3) {
                    people[i].infect();
                } else if (randomChance > 0.3 && randomChance < 0.5) {
                    people[i].injure();
                } else if (randomChance > 0.85) {
                    closestInfected.die();

                }
            } else {
                if (randomChance < 0.6) {
                    people[i].infect();
                } else if (randomChance > 0.85) {
                    closestInfected.die();
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

    if ((notInfectedCount * 100)/infectedCount < 20) {
        people.add(new Survivor(false));
    }
}
///////////////////////
// Globals
///////////////////////
