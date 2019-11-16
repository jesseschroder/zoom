#include <iostream>
#include <string>
#include <array>

using namespace std;

string* sortGrades(int grades[], string students[]) {
  int i,y;
  string sorted[10];
  
  for (i = 0; i < sizeof(students)/sizeof(students[0]); i++) {
    int min, tempGrade;
    for (y = 0; y < sizeof(students)/sizeof(students[0]); i++) {
      if (grades[i] < grades[y]) 
        min = y;
    }
    
    sorted[i] = students[min];
  }
  return sorted;
}

int main() {
  string students[10] = { "Pikachu", "Charmander", "Squirtle", "Bulbasaur", "Haunter", "Mew", "Diglet", "Pidgey", "Pidgeysucks", "Metapod"};
  int grades[10] = { 95, 55, 74, 82, 69, 93, 77, 78, 3, 44 };

  string sortedStudents [10];
  copy(sortGrades(grades, students), sortGrades(grades, students)+10, sortedStudents);
  for (int i = 0; i < 10; i++) {
    cout << sortedStudents[i] << endl;
  }
  return 0;
}
