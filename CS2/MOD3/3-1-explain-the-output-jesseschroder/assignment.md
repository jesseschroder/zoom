```
int stuff[5];
for (int i=0; i < 5; i++)
  {
    stuff[i] = i;
  }
  ```
This code creates an array of 5 integers in static memory. The for loop then assigns a value to each integer in the array { 0, 1, 2, 3, 4 }.

```
  int *otherStuff = stuff;
  ```

A pointer variable is created and is assigned the value of `stuff`. This value itself is a pointer as it is used for an array. This means that both `stuff` and `otherstuff` are pointing to the same address in memory, which is the first value in the array.

```
for (int i=0; i < 5; i++)
  {
    otherStuff[i] = i*2;
  }
  ```

  This loop takes the otherstuff pointer and loops through the array assigning new integer values, double the previous amount. {0, 2, 4, 6, 8}

  ```
    changeValue(&(otherStuff[0]));
  ```

A function is called and we are passing the reference of the first position of the other stuff pointer. This doesn't really make sense because `otherstuff` pointer could just be passed with the same result. 

```
void changeValue(int *element)
{
  *element += 999;
}
```

This function takes an integer _pointer_ as a parameter. `*element`  then _dereferences_ that pointer to the value at that location, which is 0. 0 = 0 + 999. Since this is a pointer, not a copy of the value, the original array value is changed without needing to be returned. 

```
  for (int i=0; i < 5; i++)
  {
    cout << stuff[i] << endl;
  }
```

Prints the stuff  999, 2, 4, 6, 8 each on their own line. 