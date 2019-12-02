#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct domino {
  int top, bottom;
  char hey[4] = "hey";
  //string topBody1, topBody2, topBody3, botBody1, botBody2, botBody3;
  //string topLine =    " _____ ";
  //string middle = "|-----|";
  //string bottomLine = " ‾‾‾‾‾ ";
};

void generateDominos(domino dominoSet[]);
void generateDrawing(domino& domino, int top, int bottom);

int main() {
  const int dominoTotal = 28;
  domino dominoSet[dominoTotal];
  
  generateDominos(dominoSet);
  
  // displaySet(dominoSet);
  return 0;
}

void generateDominos(domino dominoSet[]) {
  int i, j;
  for (i = 0; i <= 7; i++) {
      int multiplier = i - (i / 2);
    for (j = 0; j <= i; j++) {
      int arrayLocation;
      if (i % 2 == 1) {
        arrayLocation = i * multiplier + j;
      } else {
        arrayLocation = i * multiplier + multiplier + j;
      }
      dominoSet[arrayLocation].top = j;
      dominoSet[arrayLocation].bottom = i;
      //generateDrawing(dominoSet[arrayLocation], j, i);
    }
  }

  for (int y = 0; y <= 27; y ++) {
    cout << "Top: " << dominoSet[y].top << " Bottom: " << dominoSet[y].bottom << endl;
    //cout << dominoSet[y].topLine << dominoSet[y].topBody2 << dominoSet[y].botBody2 << endl;
  }
}
/*
void generateDrawing(domino& domino, int top, int bottom) {
  if (top == 0) {
    domino.topBody1 = "|     |";
    domino.topBody2 = "|     |";
    domino.topBody3 = "|     |";
  } else if (top == 1) {
    domino.topBody1 = "|     |";
    domino.topBody2 = "|  *  |";
    domino.topBody3 = "|     |";
  } else if (top == 2) {
    domino.topBody1 = "| *   |";
    domino.topBody2 = "|     |";
    domino.topBody3 = "|   * |";
  } else if (top == 3) {
    domino.topBody1 = "| *   |";
    domino.topBody2 = "|  *  |";
    domino.topBody3 = "|   * |";
  } else if (top == 4) {
    domino.topBody1 = "| * * |";
    domino.topBody2 = "|     |";
    domino.topBody3 = "| * * |";
  } else if (top == 5) {
    domino.topBody1 = "| * * |";
    domino.topBody2 = "|  *  |";
    domino.topBody3 = "| * * |";
  } else if (top == 6) {
    domino.topBody1 = "| * * |";
    domino.topBody2 = "| * * |";
    domino.topBody3 = "| * * |";
  }

  if (bottom == 0) {
    domino.botBody1 = "|     |";
    domino.botBody2 = "|     |";
    domino.botBody3 = "|     |";
  } else if (bottom == 1) {
    domino.botBody1 = "|     |";
    domino.botBody2 = "|  *  |";
    domino.botBody3 = "|     |";
  } else if (bottom == 2) {
    domino.botBody1 = "| *   |";
    domino.botBody2 = "|     |";
    domino.botBody3 = "|   * |";
  } else if (bottom == 3) {
    domino.botBody1 = "| *   |";
    domino.botBody2 = "|  *  |";
    domino.botBody3 = "|   * |";
  } else if (bottom == 4) {
    domino.botBody1 = "| * * |";
    domino.botBody2 = "|     |";
    domino.botBody3 = "| * * |";
  } else if (bottom == 5) {
    domino.botBody1 = "| * * |";
    domino.botBody2 = "|  *  |";
    domino.botBody3 = "| * * |";
  } else if (bottom == 6) {
    domino.botBody1 = "| * * |";
    domino.botBody2 = "| * * |";
    domino.botBody3 = "| * * |";
  }
}*/

  
  















