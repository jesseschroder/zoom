#include <iostream>
#include <string>
#include <ctime>
#include <cstdlib>

using namespace std;

struct domino {
  int top, bottom;
};

void generateDominos(domino dominoSet[]);
void displaySet(domino dominoSet[]);
void randomizeSet(domino set[]);
void askForShuffle(domino set[]);

int main() {
  const int dominoTotal = 28;
  srand(time(0));
  domino dominoSet[dominoTotal];
  generateDominos(dominoSet);
  system("clear");  
  cout << "Here's a set of Domino's!" << endl; 
  displaySet(dominoSet);

  askForShuffle(dominoSet);
  return 0;
}

void generateDominos(domino dominoSet[]) {
  int i, j;
  int x = 0;
  for (i = 0; i < 7; i++) {
    for (j = 0; j <= i; j++) {
      dominoSet[x].top = j;
      dominoSet[x].bottom = i;
      x++;
    }
  }
}

void askForShuffle(domino set[]) {
  char input;
  bool running = true;
  cout << "Would you like to shuffle? y / n ";

  while (running) {
    input = cin.get();
    switch(input) {
      case 'y' :
        system("clear");
        randomizeSet(set);
        displaySet(set);
        cout << endl << "Would you like to shuffle again? y / n ";
      break;
      case 'n' :
        running = false;
      break;
    }
  }
  cout << endl << "Enjoy!";
}

void displaySet(domino set[]) {
  int numberOfRows = 4;
  const int rowLength = 7;
  string topLine =    " _____ ";
  string middle = "|-----|";
  string bottomLine = " ‾‾‾‾‾ ";
  string topValues[rowLength] = {"|     |", "|     |", "| *   |", "| *   |", "| * * |", "| * * |", "| * * |"};
  string midValues[rowLength] = {"|     |", "|  *  |", "|     |", "|  *  |", "|     |", "|  *  |", "| * * |"};
  string botValues[rowLength] = {"|     |", "|     |", "|   * |", "|   * |", "| * * |", "| * * |", "| * * |"};



  for (int i = 0; i < numberOfRows; i++) {
    int pointModifier = i * rowLength;

    for (int j = 0; j < rowLength; j++) {
      cout << topLine << " ";
    }
    cout << endl;
    for (int j = 0; j < rowLength; j++) {
      cout << topValues[set[pointModifier + j].top] << " ";
    }
    cout << endl;
    for (int j = 0; j < rowLength; j++) {
      cout << midValues[set[pointModifier + j].top] << " ";
    }
    cout << endl;
    for (int j = 0; j < rowLength; j++) {
      cout << botValues[set[pointModifier + j].top] << " ";
    }
    cout << endl;
    for (int j = 0; j < rowLength; j++) {
      cout << middle << " ";
    }
    cout << endl;
    for (int j = 0; j < rowLength; j++) {
      cout << topValues[set[pointModifier + j].bottom] << " ";
    }
    cout << endl;
    for (int j = 0; j < rowLength; j++) {
      cout << midValues[set[pointModifier + j].bottom] << " ";
    }
    cout << endl;
    for (int j = 0; j < rowLength; j++) {
      cout << botValues[set[pointModifier + j].bottom] << " ";
    }
    cout << endl;
    for (int j = 0; j < rowLength; j++) {
      cout << bottomLine << " ";
    }
    cout << endl;
  }
}

void randomizeSet(domino set[]) {
  for (int i = 0; i < 28; i++) {
    int randomSpot = rand() % 27;
    domino tempDomino = set[i];
    set[i] = set[randomSpot];
    set[randomSpot] = tempDomino;
  }
}
