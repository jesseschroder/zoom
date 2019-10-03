/*
A merchant mainly sells cans of mixed fruit, containing papayas, bananas, and mangoes. To be as consistent as possible,
the merchant wants to maintain a relatively consistent proportion of each fruit in any given can. Each can must have
at least 10% papaya and at least half as much papaya as banana.

Suppose for a given can that the amount of papaya is "p", the amount of mango is "m", and the amount of banana is "b"
(all floats). Write a Boolean expression that says whether the can should be sold. That is, use the variables above
to create an expression that will result in true only if the makeup of a can can be sold.

*/

float p; // 20
float m; // 80
float b; // 45

if ((p * 100)/(p + m + b) >= 10 &&
    b/2 > p)
