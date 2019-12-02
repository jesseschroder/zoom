#include <iostream>
#include <string.h>

using namespace std;


class flower
{
public:
  string color;
  int height;
  float percentWater;

  flower(string newColor, int newHeight, float newWater) {
    color = newColor;
    height = newHeight;
    percentWater = newWater;
  }

  void print() {
    cout << color << " (" << height << " cm. " << percentWater << "% water)" << endl;
  }

  void grow() {
    height += 2;
    percentWater -= 0.05f;
  }

  void water() {
    percentWater += 0.1f;
  }
};
/*
void printFlower(flower &f)
{
  cout << f.color << " (" << f.height << " cm, "
       << f.percentWater << "% water)" << endl;
}

void growFlower(flower &f)
{
  f.height += 2;
  f.percentWater -= 0.05f;
}

void waterFlower(flower &f)
{
  f.percentWater += 0.1f;
}
*/
int main()
{
  string color = "purple";
  int height = 10;
  float percentWater = 0.5f;
  
  flower f(color, height, percentWater);

  f.print();
  f.water();
  f.print();
  f.grow();
  f.print();

/*
  printFlower(f);

  waterFlower(f);

  printFlower(f);

  growFlower(f);

  printFlower(f);
*/
  return 0;
}
