#include <iostream>

using namespace std;

float getAverageScore(int * scoreArray, int length);

int main() {
  const int scoreTotal = 10;
  int scores[scoreTotal];

  for (int i = 0; i < scoreTotal; i +=1 ) scores[i] = i;

  cout << getAverageScore(scores, scoreTotal) << endl;
  return 0;
}

float getAverageScore(int * scoreArray, int length) {
  float total = 0;

  for (int i = 0; i < length; i++) total += scoreArray[i];
  return total;
}
