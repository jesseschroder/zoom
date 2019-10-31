////////////////////
// Bird
////////////////////
class Bird
{
  float     x, y;
  float     speed;
  int       currentFrame;
  
  Bird(float bx, float by)
  {
    x = bx;
    y = by;
    
    speed = random(5,10);
    
    currentFrame = int(random(8));
    
    
  }
}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////


Bird[] birds;
final int numBirds = 3000000;

PImage beach;
PImage[]  images;



void setup()
{
  size(800,600);
  
  birds = new Bird[numBirds];
  for (int i=0; i < birds.length; i++)
  {
    birds[i] = new Bird(random(width), random(height/3));
  }
  
  beach = loadImage("beach.jpg");
  images = new PImage[8];

  for (int i=0; i < images.length; i++)
    {
      images[i] = loadImage("bird_cell_" + i + ".gif");
    }

  
  // Default is 60 frames per second, which is too fast
  frameRate(20);
}


void draw()
{
  image(beach, 0, 0);
  
  for (int i=0; i < birds.length; i++)
  {
    move(birds[i]);
    drawBird(birds[i]);
  }
}

void drawBird(Bird b)
{
  image(images[b.currentFrame], b.x, b.y);
}


void move(Bird b)
{
  b.x = b.x + b.speed;
  
  if (b.x > width)
  {
    b.x = -images[b.currentFrame].width;
  }
  
  b.currentFrame = (b.currentFrame + 1) % images.length;
}