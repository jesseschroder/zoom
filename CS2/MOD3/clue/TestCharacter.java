public class TestCharacter{
  
 public static void main(String[] args) {
  
  Character characterArray[] = new Character[7];

  characterArray[0] = new Character();
  characterArray[0].name = "Colonel Mustard";
  characterArray[0].hitPoints = 10;
  characterArray[0].maxHitPoints = 15;

  characterArray[1] = new Character();
  characterArray[1].name = "Miss Scarlet";
  characterArray[1].hitPoints = 12;
  characterArray[1].maxHitPoints = 13;

  characterArray[2] = new Character();
  characterArray[2].name = "Mrs Peacock";
  characterArray[2].hitPoints = 12;
  characterArray[2].maxHitPoints = 14;

  characterArray[3] = new Character();
  characterArray[3].name = "Mrs White";
  characterArray[3].hitPoints = 8;
  characterArray[3].maxHitPoints = 10;

  characterArray[4] = new Character();
  characterArray[4].name = "Mr. Boddy";
  characterArray[4].hitPoints = 11;
  characterArray[4].maxHitPoints = 14;

  characterArray[5] = new Character();
  characterArray[5].name = "Professor Plum";
  characterArray[5].hitPoints = 14;
  characterArray[5].maxHitPoints = 16;

  characterArray[6] = new Character();
  characterArray[6].name = "Reverand Green";
  characterArray[6].hitPoints = 7;
  characterArray[6].maxHitPoints = 9;
  
  printArray(characterArray);

  healCharacter(characterArray[4], 5);

  printArray(characterArray);

  System.out.println("The healthiest person is " +
                    nameOfMostHealthyCharacter(characterArray));
 }

  public static void printArray(Character[] characters) {
    for (int i = 0; i < characters.lengt ; i++) {
      System.out.print(characters[i].name + ":\t"); 
      if (characters[i].name.length() < 14)
        System.out.print("\t");

      System.out.print(characters[i].hitPoints + "\t(" + characters[i].maxHitPoints + ")");
    }
    System.out.println();
  }

  public static void healCharacter(Character characterToHeal, int health) {
  characterToHeal.hitPoints += health;
  if (characterToHeal.hitPoints > characterToHeal.maxHitPoints) {
    characterToHeal.hitPoints = characterToHeal.maxHitPoints;
    }
  }

  public static String nameOfMostHealthyCharacter(Character[] characters) {
  int healthiestIndex = 0;
  int highestHealth = characters[0].hitPoints;

  for (int i=1; i < characters.length; i++) {
    if (characters[i].hitPoints > highestHealth) {
      healthiestIndex = i;
      highestHealth = characters[i].hitPoints;
      }
    }
  return characters[healthiestIndex].name;
  }
}
