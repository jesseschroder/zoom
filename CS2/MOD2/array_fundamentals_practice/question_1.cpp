#include <iostream>

using namespace std;

bool isSorted(int array[], int numItems);

int main() {
  const int ARRAYSIZE = 10;
  int array1[ARRAYSIZE] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  int array2[ARRAYSIZE] = {2, 2, 4, 5, 6, 6, 7, 8, 9, 9};
  int array3[ARRAYSIZE] = {1, 3, 2, 4, 5, 6, 7, 8, 9, 10};

  cout << "Arrary 1 should return True and it returns " << isSorted(array1, ARRAYSIZE) << endl;
  cout << "Arrary 2 should return True and it returns " << isSorted(array2, ARRAYSIZE) << endl;
  cout << "Arrary 3 should return False and it returns " << isSorted(array3, ARRAYSIZE) << endl;


  return 0;
}


bool isSorted(int array[], int numItems) {
  bool sorted = true;

  for (int i = 1; i < numItems; i++) {
    if (array[i - 1] > array[i]) sorted = false;
  }
  return sorted;
}


