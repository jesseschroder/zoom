final int[] numbers = new int[10];
final int[] sortedNumbers = new int[10];

boolean showSorted;

void setup()
{
  size(500,200);

  showSorted = true;

  // Fill both arrays with the same numbers
  int num = 0;
  while (num < numbers.length)
  {
    numbers[num] = (int)random(5, 30);
    sortedNumbers[num] = numbers[num];
    
    num++;
  }
  
  // Sort the second array
  sortArray(sortedNumbers);
}

void sortArray(int[] numbers) {
    int outerIndex = 1;
    while(outerIndex < sortedNumbers.length) {
        int innerIndex = outerIndex;
        while (innerIndex > 0 &&
         sortedNumbers[innerIndex] < sortedNumbers[innerIndex - 1]) {
            int valueToMoveLeft = sortedNumbers[innerIndex];
            sortedNumbers[innerIndex] = sortedNumbers[innerIndex - 1];
            sortedNumbers[innerIndex - 1] = valueToMoveLeft;
            innerIndex--;
         }
         outerIndex++;
    }
}

void draw()
{
  background(255);
  textAlign(CENTER, CENTER);
  
  final int buttonWidth = 40;
  
  int[] array;
  if (showSorted)
  {
    array = sortedNumbers;
  }
  else
  {
    array = numbers;
  }
  
  float spaceBetween = (width - (buttonWidth*array.length)) /
                       (array.length + 1);
                       
  int buttonNum = 0;
  while (buttonNum < array.length)
  {
    float buttonHeight = array[buttonNum] * 2;
    
    float x = (buttonNum+1)*spaceBetween + buttonNum*buttonWidth;
    float y = height/2 - buttonHeight/2;
   
    fill(230);   
    rect(x, y, buttonWidth, buttonHeight);
         
    fill(0);
    text(array[buttonNum], x + buttonWidth/2, y + buttonHeight/2);  
    
    buttonNum++;
  }  
}

void keyPressed()
{
  showSorted = !showSorted;
}