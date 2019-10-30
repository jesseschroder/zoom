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
    println(productSet.size());
}

void generateProducts() {
    for (int i = 0; i < productCount; i++) {
        productSet.add(new Product((productBuffer - productWidth) + productBuffer*i));
    }
}

void draw() {
    background(225);
    drawProducts();
}

void drawProducts() {


    for (int i = 0; i < productCount; i++) {
        Product product = productSet.get(i);
        fill(product.colour);
        rect(product.x, product.y - product.h, product.w, product.y);

        fill(0);
        text("$"+product.price, product.x + productWidth/2, product.y + 30);
    }
}

void sortByPrice(ArrayList products) {
    int i, j, min, x;
    // Product x, y;
    for (i = 0; i < productSet.size(); i++) {
        min=i;
        for(j = 1+i; j < productSet.size(); j++) {
            if (productSet.get(j).price < productSet.get(min).price) {
                min = j;
            }
        }

        // x = productSet.get(i).price;
        // productSet.get(i).price = productSet.get(min).price;
        // productSet.get(min).price = x;
        println(i + " " + j);
        x = productSet.get(i);
        y = productSet.get(min);
        productSet.set(i, y);
        productSet.set(min, x);
    }
}

void sortBySize(ArrayList products) {

}

void keyPressed() {
    switch(key) {
        case 'p' :
            // println(productSet);
            sortByPrice(productSet);
            // println(productSet);
        break;
    }
}

/*


   public void orderAsc(int vector[]) {
      int i, j, min, x;
      for (i = 0; i < vector.length-1; i++) {
         min=i;
         for (j = i+1; j < vector.length; j++)
            if (vector[j] < vector[min])
               min = j;

         x = vector[i];
         vector[i] = vector[min];
         vector[min] = x;
      }
   }
*/