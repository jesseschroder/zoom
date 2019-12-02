#include <iostream>

using namespace std;


int countCaps(char charArray[], int arraySize);

int main() {
  const int ARRAYSIZE = 5;
  char array1[ARRAYSIZE] = {'h', 'e', 'l', 'l', 'o'};
  char array2[ARRAYSIZE] = {'H', 'E', 'L', 'L', 'O'};
  char array3[ARRAYSIZE] = {'h', 'E', 'l', 'L', 'o'};

  cout << "Array 1 should have 0 capitals, and it actually has " << countCaps(array1, ARRAYSIZE) << endl;
  cout << "Array 2 should have 5 capitals, and it actually has " << countCaps(array2, ARRAYSIZE) << endl;
  cout << "Array 3 should have 2 capitals, and it actually has " << countCaps(array3, ARRAYSIZE) << endl;

  return 0;
}

int countCaps(char charArray[], int arraySize) {
  int capCount = 0;

  for (int i = 0; i < arraySize; i++) {
    if (charArray[i] < 96) capCount++;
  }
  return capCount;
}
