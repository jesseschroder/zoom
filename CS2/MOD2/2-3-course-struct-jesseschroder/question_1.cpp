#include <iostream>
#include <string>

using namespace std;

struct course {
  string department;
  int courseNumber;
  string title;
};

int countCourseDepartments(course courseList[], string departmentName, int listLength);

int main() {
  const int courseListLength = 10;
  string comp = "COMP";
  string biol = "BIOL";
  string econ = "ECON";
  string psci = "PSCI";


  course courseList[courseListLength] = {
    {comp, 1005, "Introduction to Computer Science I"},
    {comp, 1006, "Introduction to Computer Science II"},
    {biol, 1010, "Biotechnology and Society"},
    {econ, 1000, "Introduction to Economics"},
    {econ, 1001, "Introduction to Microeconomics"},
    {econ, 1002, "Introduction to Macroeconomics"},
    {psci, 1100, "Democracy in Theory and Practice"},
    {psci, 1200, "World Politics"},
    {psci, 1500, "Technology, Nature, Power"},
    {psci, 1501, "Politics of Migration"}
  };
  int compCount = countCourseDepartments(courseList, comp, 10);
  int biolCount = countCourseDepartments(courseList, biol, courseListLength);
  int econCount = countCourseDepartments(courseList, econ, courseListLength);
  int psciCount = countCourseDepartments(courseList, psci, courseListLength);
  
  return 0;
}

int countCourseDepartments(course courseList[], string departmentName, int listLength) {
  int counter = 0;

  for (int i = 0; i < listLength; i++) {
    if (courseList[i].department.compare(departmentName) == 0) counter++;
  }
  cout << departmentName << " " << counter << endl;
  return counter;
}
