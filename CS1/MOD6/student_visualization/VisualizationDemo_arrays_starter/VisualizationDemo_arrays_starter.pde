/*
------------------------------------
Foreign Student Data Visualization
------------------------------------

This program was created by Gail Carmichael for 
COMP 1405: Introduction to Computer Science 1.
It introduces Strings, objects, algorithms and
recursion.
 
The program reads in real data about how many
students come from various countries to study
in Canada.  A visual comparison of the top 16
countries is made with circles of varying sizes
and colours.  When you click on a circle, you
will see a line graph with the number of students
from each quarter (2013).  When the 's' key is
pressed, the data will change its sorting order
between number of students and name of country,
both ascending.

This version uses arrays to store all the data and
does not support resorting yet, nor does it draw the
actual line graph.
 
*/

//////////////////////////////////////////////////
// These variables are for storing the information
// obtained from the open data csv file from
// http://data.gc.ca/data/en/dataset/cdc14bcf-d9b1-4130-b743-6830f25c9b64

String[] countryNames;
int[]    numQ1_2013;
int[]    numQ2_2013;
int[]    numQ3_2013;
int[]    numQ4_2013;
int[]    numTotal_2013;

final String filename = "foreign-student-data.csv";


//////////////////////////////////////////////////
// Data that will help draw the circles

int totalTopNCountries2013;
final int numRows = 4;
final int numCols = 4;

final int maxCircleDiameter = 120;

//////////////////////////////////////////////////
// Data that will help draw the line graph

int graphShowingIndex;


//////////////////////////////////////////////////
// setup
void setup()
{
  size(750,750);
  
  // Get the data from the CSV file
  readData();
  
  // Save how many students there are total for
  // the top 16 countries in 2013 so we don't have
  // to recalculate it all the time
  totalTopNCountries2013 = sumTotalStudentsForTopNCountries(numRows * numCols);
  
  // Set to -1 to indicate that we are not showing data right now
  graphShowingIndex = -1;
}


//////////////////////////////////////////////////
// draw
void draw()
{
  background(255);
  
  drawTopNCountries();
  
  if (graphShowingIndex >= 0)
  {
    drawLineGraph(graphShowingIndex);
  }
}


//////////////////////////////////////////////////
// A function that reads in foreign student data from
// the given csv file.  This comes from the 
// ReadingOpenData example (look there for more comments).
void readData()
{
  String[] lines = loadStrings(filename);
  
  // We will discard the first and last 3 lines of the file
  int numCountries = lines.length - 6;
  
  countryNames = new String[numCountries];
 
  numQ1_2013 = new int[numCountries];
  numQ2_2013 = new int[numCountries];
  numQ3_2013 = new int[numCountries];
  numQ4_2013 = new int[numCountries];
  numTotal_2013 = new int[numCountries];
  
  // Next we need to loop over the lines and fill in the arrays
  int lineIndex = 0;
  while (lineIndex < lines.length)
  {
    // Skip the first and last three lines
    if (lineIndex < 3 || lineIndex >= lines.length - 3)
    {
      lineIndex++;
      continue;
    }
    
    // The country number is not equal to the line index
    int countryNum = lineIndex - 3;
    
    // Break each line apart by separating at the comma
    String[] splitLine = lines[lineIndex].split(",");
    
    countryNames[countryNum] = splitLine[0];
    numQ1_2013[countryNum] = Integer.parseInt(splitLine[1]);
    numQ2_2013[countryNum] = Integer.parseInt(splitLine[2]);
    numQ3_2013[countryNum] = Integer.parseInt(splitLine[3]);
    numQ4_2013[countryNum] = Integer.parseInt(splitLine[4]);
    numTotal_2013[countryNum] = Integer.parseInt(splitLine[5]);
    
    lineIndex++;
  }
}


//////////////////////////////////////////////////
// Calculates the total number of students at the end of
// 2013 for the top n countries.
int sumTotalStudentsForTopNCountries(int n)
{
  return 0;
}


//////////////////////////////////////////////////
// Calculates the maximum number of students from the
// top n countries.
int maxTotalStudentsForTopNCountries(int n)
{
  return 0;
}


//////////////////////////////////////////////////
// Given a row and col, what is the x/y coordinate?

float getXCoordinateForRowAndCol(int rowNum, int colNum)
{
  return (colNum+1)*getHorizontalSpacing()
         + colNum*maxCircleDiameter  
         + maxCircleDiameter/2;
}

float getYCoordinateForRowAndCol(int rowNum, int colNum)
{
  return (rowNum+1)*getVerticalSpacing()
         + rowNum*maxCircleDiameter 
         + maxCircleDiameter/2;
}


//////////////////////////////////////////////////
// Calculate the spacing between the max size of
// the circles

float getHorizontalSpacing()
{
  return (width - numCols*maxCircleDiameter)/(float)(numCols+1);
}

float getVerticalSpacing()
{
  return (height - numRows*maxCircleDiameter)/(float)(numRows+1);
}


//////////////////////////////////////////////////
// A function to draw the circles for the top 16 countries,
// including their labels
void drawTopNCountries()
{
  final int numCircles = numRows * numCols;
  
  // Calculate how much space to put in between each circle
  // in terms of the max width (there are "cols" circles
  // per row).
  final float spaceHor = getHorizontalSpacing();
  final float spaceVer = getVerticalSpacing();
  
  // What is the highest number of total students? Circles
  // will be sized relative to that.
  final int maxTotalStudents = maxTotalStudentsForTopNCountries(numCircles);
  
  
  
}


//////////////////////////////////////////////////
// A function to draw a line graph in the middle of the
// screen for the country at the given index
void drawLineGraph(int index)
{
  final int padding = 40;
  
  final int rectWidth = (int)(width * 0.8f);
  final int rectHeight = (int)(height * 0.6f);
  
  final int axisX = width/2 - rectWidth/2 + padding;
  final int axisY = height/2 + rectHeight/2 - padding;
  final int axisHeight = rectHeight - 2 * padding;
  
  final int numPoints = 4; // one for each quarter 2013
  
  
}


//////////////////////////////////////////////////
// Find the index of the country this coordinate falls on
// (if any)
int getIndexOfCountryAt(int x, int y)
{
  int index = -1; // default: not found
  
  
  
  return index;
}


//////////////////////////////////////////////////
// mouseClicked
void mouseClicked()
{
  
}