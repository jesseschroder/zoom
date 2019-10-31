/*
For this question you will create a small sorting demonstration. You have the option of drawing a 
visualization or printing out information on the console.

First, create a class that represents something commerce- or Shopify-related, and that has a property 
that can be sorted (for example, by size, weight, price, etc). If you choose to draw a visualization, 
include an x location and a y location in the class. Give the class a suitable constructor and any 
other relevant variables.

Then, outside of the class, create a function that takes no parameters but returns a new instance of 
the class you just designed with reasonable random values. For example, if you made a unicorn class 
that could be different sizes, you might have a function called randomUnicorn() that returned a new 
instance with a random size.

Next, write an output function that takes a single instance of your class as a parameter but does not 
return anything. Your function should either draw or print out information about your object such that 
you visualize or print out the magnitude of the attribute that can be sorted.  For example, if drawing, 
the height of the objects could be different.

Now write a function called selectionSort that takes an array of your objects as a parameter and returns 
nothing. The function will use the selection sort algorithm to sort the array in place (so the parameter 
array will be modified).

Finally, test your sorting algorithm by creating an array of random objects using the function you 
wrote earlier, then drawing the objects in sorted order. It must be obvious to the person running the 
program that the objects are sorted just by looking at the output.
*/
import java.util.*;

final int productWidth = 80;
final int productBuffer = 100;
final int productCount = 10;
final String instructions = "p - Sort by Price / s - Sort by Size / r - Reset (unsort)";

ArrayList<Product> productSet = new ArrayList<Product>();

class Product {
    int x, y, w, h, price;
    color colour;

    Product(int productX) {
        x = productX;
        y = 300;
        w = x + productWidth;
        h = int(random(20,100));
        price = int(random(10, 1000));

        colour = color(random(50, 200),
                    random(50, 200),
                    random(50, 200));
    }
}

void settings() {
    size(productCount * productBuffer + (productBuffer - productWidth), 400);
}

void setup() {
    generateProducts();

    rectMode(CORNERS);
    stroke(0);
    strokeWeight(3);
    textSize(24);
    textAlign(CENTER, CENTER);
}

void generateProducts() {
    for (int i = 0; i < productCount; i++) {
        productSet.add(new Product((productBuffer - productWidth) + productBuffer*i));
    }
}

void draw() {
    background(225);
    drawProducts();
    drawInstructions();
}

void drawInstructions() {
    text(instructions, width/2, 50);
}

void drawProducts() {
    for (int i = 0; i < productCount; i++) {
        Product product = productSet.get(i);
        fill(product.colour);
        int xPos = (productBuffer - productWidth) + productBuffer*i;
        rect(xPos, product.y - product.h, xPos+productWidth, product.y);

        fill(0);
        text("$"+product.price, xPos + productWidth/2, product.y + 30);
    }
}

void sortByPrice() {
    int i, j, min;
     Product x;
    for (i = 0; i < productSet.size(); i++) {
        min=i;
        for(j = 1+i; j < productSet.size(); j++) {
            if (productSet.get(j).price < productSet.get(min).price) {
                min = j;
            }
        }

        x = productSet.get(i);
        productSet.set(i, productSet.get(min));
        productSet.set(min, x);
    }
}

void sortBySize() {
    int i, j, min;
     Product x;
    for (i = 0; i < productSet.size(); i++) {
        min=i;
        for(j = 1+i; j < productSet.size(); j++) {
            if (productSet.get(j).h < productSet.get(min).h) {
                min = j;
            }
        }

        x = productSet.get(i);
        productSet.set(i, productSet.get(min));
        productSet.set(min, x);
    }
}

void sortByX() {
    int i, j, min;
     Product x;
    for (i = 0; i < productSet.size(); i++) {
        min=i;
        for(j = 1+i; j < productSet.size(); j++) {
            if (productSet.get(j).x < productSet.get(min).x) {
                min = j;
            }
        }

        x = productSet.get(i);
        productSet.set(i, productSet.get(min));
        productSet.set(min, x);
    }
}

void keyPressed() {
    switch(key) {
        case 'p' :
            sortByPrice();
        break;
        case 's' :
            sortBySize();
        break;
        case 'r' :
            sortByX();
        break;
    }
}