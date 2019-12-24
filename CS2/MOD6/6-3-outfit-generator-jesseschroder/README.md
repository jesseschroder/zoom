# Assignment6-3


###Object Hierarchy 

```
                  _ _ _ _ _ _                   _____________
                 | Interface |  - - - - >      |  Clothing   |
                  ‾ ‾ ‾ ‾ ‾ ‾                   ‾‾‾‾‾‾‾‾‾‾‾‾‾                        
                                                      |
           -------------------------------------------|-----------------------------------------
           |                    |                     |                    |                    |
           ▼                    ▼                     ▼                    ▼                    ▼
     _____________        _____________         _____________        _____________        _____________
    |   abstract  |      |   abstract  |       |   abstract  |      |   abstract  |      |   abstract  |
    |    Shirts   |      |    Pants    |       |    Shoes    |      |  Outerwear  |      | Accessories |
     ‾‾‾‾‾‾‾‾‾‾‾‾‾        ‾‾‾‾‾‾‾‾‾‾‾‾‾         ‾‾‾‾‾‾‾‾‾‾‾‾‾        ‾‾‾‾‾‾‾‾‾‾‾‾‾        ‾‾‾‾‾‾‾‾‾‾‾‾‾ 
           |                    |                     |                    |                    |
           ▼                    ▼                     ▼                    ▼                    ▼
     _____________        _____________         _____________        _____________        _____________
    |   subclass  |      |   subclass  |       |   subclass  |      |   subclass  |      |   subclass  |
     ‾‾‾‾‾‾‾‾‾‾‾‾‾        ‾‾‾‾‾‾‾‾‾‾‾‾‾         ‾‾‾‾‾‾‾‾‾‾‾‾‾        ‾‾‾‾‾‾‾‾‾‾‾‾‾        ‾‾‾‾‾‾‾‾‾‾‾‾‾ 
     _____________        _____________         _____________        _____________        _____________
    |     ...     |      |     ...     |       |     ...     |      |     ...     |      |     ...     |
     ‾‾‾‾‾‾‾‾‾‾‾‾‾        ‾‾‾‾‾‾‾‾‾‾‾‾‾         ‾‾‾‾‾‾‾‾‾‾‾‾‾        ‾‾‾‾‾‾‾‾‾‾‾‾‾        ‾‾‾‾‾‾‾‾‾‾‾‾‾
```

The clothing class is the parent of all the clothing type classes. It implements an interface that filters down to all
subclasses for global methods to be used on any piece of clothing (ex. wear in the cold). The abstract parent classes of
the subclasses create methods that are specific for their use (ex. Shirts compatible with ties). This design makes it
easy to creater arrays of clothing types and have all methods available needed to run through the validation checks on
the outfit builder.

###Outfit Builder

The outfit builder is a class that runs checks on and outfit passed from the closet class. The closet class randomly
selects 5 articles of clothing, and then creates an outfit object which is then passed back to the builder for checks.
If the check fails, a new outfit is requested.

###Characteristics

The interface implements the following:

- casual
- athletic
- dressy
- colourful
- plain
- wear in the cold
- wear in the heat

Accessories check for 
- is jewelry
- is tie

Shirts check for compatibility with ties.

###Checks

While all articles of clothing have the check, it is not always needed to pass a check. For example, outerwear is not 
checked for `plain`. 

The checks that run are 

- Is the outfit too plain?
- Is the outfit too colourful?
- Can it be worn in the heat? Can it be worn in the cold? (one of the two needs to pass)
- Outfit dressy?
- Outfit casual?
- Jewelry being worn when not appropriate?
- Tie being worn on a proper shirt?
- Are the clothes athletic?
- Verify naked options are being used properly (ex. not wearing pants with a dress is okay, but you need pants otherwise)

Not all checks need to pass 100% either. Athletic clothing is allowed in combinations of other clothing (ex running shoes 
with jeans), however the outfit should not have too many athletic items unless the whole outfit is athletic.

These checks are all processed in the outfit builder. A while loop continues to take outfits until it finds one that 
passes all checks. At that point, the outfit goes through a string function to assemble a nice output which is then passed 
back to the test class. 

