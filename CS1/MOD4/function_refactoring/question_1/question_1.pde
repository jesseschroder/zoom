/* QUESTION 2

Generalization 

The "drawCricles" function has been generalized down to a single line in the draw function. It draws 3 circles, however
the details of these circles has been abstracted down into variables to describe the circles in our function (placement, size, color).

Hiding details

I was able to find and abstract a pattern with how the circles were originally being drawn with size, and colour. The colours RGB value would each increase
by 30 for each circle. The sizing of the circles would also double for each after the first. Since this is the same for each circle, we are able
to hide the details for this inside the function so the user doesn't need to see how it's calculating these changes. 

*/


void setup()
{
  size(500,500);
}

void draw()
{
  background(255);
  
  // Circle 1
  drawCircles(50, 50, 25, 180, 0, 0);

  // Cricle 2
  drawCircles(275, 300, 50, 50, 50, 0);

  // Circle 3
  drawCircles(350, 80, 35, 0, 0, 195);
}

void drawCircles(int x, int y, int size, int red, int green, int blue) {
    fill(red, green, blue);
    ellipse(x, y, size*4, size*4);

    fill(red + 30, green + 30, blue + 30);
    ellipse(x, y, size*2, size*2);

    fill(red + 60, green + 60, blue + 60);
    ellipse(x, y, size, size);
}