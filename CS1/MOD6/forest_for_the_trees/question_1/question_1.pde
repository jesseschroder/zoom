/*
Create a class with the name Tree. The tree will eventually be drawn as a brown rectangle 
for the trunk with a coloured circle on top for the leaves.

Inside the class, add attribute variables for the tree’s location, the trunk’s width and 
height, the size of the circle on top, and the colour of the circle.

Also inside the Tree class, create an array of colours that will represent what colours 
the tree tops are allowed to be – choose at least three colours that are reasonable for summer or fall.

Add a constructor to the Tree class that takes x and y coordinates as parameters. Inside 
the constructor, save the parameter coordinates in the location attributes, and set the other 
attributes to reasonable random values; the colour of the circle on top will be randomly 
chosen from the array of colours defined inside the class.

Using a loop, create an array of at least 10 Tree objects. The location values passed into 
the constructor when you create your objects will be calculated such that the trees are evenly 
spaced across the width of the window no matter what size the window is.

Write a function called drawTree that has a Tree variable as a parameter. The function will 
draw the given tree object using the object’s attributes.

Outside the drawTree function, write another loop that calls drawTree for each Tree object 
stored in the array you created earlier.

If everything is working correctly, then when the program is run, ten trees with random 
sizes and colours should be drawn evenly spaced across the screen.
*/

//////////////////////
// Global
//////////////////////

final int treeCount = 10;
Tree[] treeRow = new Tree[treeCount];

float canvasXSpread;

//////////////////////
// Classes
//////////////////////

class Tree {
    final color trunkColour = color(139,69,19);
    color[] leaveColours = {
        color(75, 150, 75),
        color(175, 175, 45),
        color(150, 60, 60),
        color(50, 200, 50)
    };

    float x, y, w, h, circleSize;
    color leafColour;

    Tree(float treeX, float treeY) {
        x = treeX;
        y = treeY;
        w = random(canvasXSpread*0.2, canvasXSpread*0.6);
        h = random(height*0.2, height*0.6);
        circleSize = random(w*2, canvasXSpread/2);

        leafColour = leaveColours[int(random(0,4))];
    }
}

//////////////////////
// Setup
//////////////////////

void setup() {
    background(225);
    size(800,400);
    noStroke();

    canvasXSpread = (width - (width / treeCount)) / treeCount;

    int y = height/2;
    for (int i = 0; i < treeCount; i++) {
        treeRow[i] = new Tree(canvasXSpread + canvasXSpread*i, y);
    }
}

//////////////////////
// Draw
//////////////////////

void draw() {
    drawBackground();
    for(int i = 0; i < treeCount; i++) {
        drawTree(treeRow[i]);
    }


}

void drawTree(Tree tree) {
    rectMode(CENTER);
    fill(tree.trunkColour);
    rect(tree.x, tree.y, tree.w, tree.h);

    fill(tree.leafColour);
    circle(tree.x, tree.y - tree.h/2, tree.circleSize);
}

void drawBackground() {
    rectMode(CORNERS);
    fill(50, 50, 175);
    rect(0, 0, width, 180);

    fill(75, 150, 75);
    rect(0, 180, width, height);
}