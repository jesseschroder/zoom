public class TestClass {
  
  public static void main(String[] args) {
    /*
    Set Things up
     */

    Season winter = new Winter();
    Season spring = new Spring();
    Season summer = new Summer();
    Season fall = new Fall();

    LegoHat touque = new LegoHat("Touque", 1, winter);
    LegoHat floralHat = new LegoHat("Floral Hat", 3, spring);
    LegoHat baseballCap = new LegoHat("Baseball Cap", 2, fall);
    LegoHat sunVisor = new LegoHat("Sun Visor", 1, summer);

    LegoItem sword = new LegoItem("Sword", 6);
    LegoItem toothPick = new LegoItem("Tooth Pick", 1);
    LegoItem giantRock = new LegoItem("Giant Rock", 20);
    LegoItem sled = new LegoItem("Sled", 5);

    /*
    Tests
     */

    System.out.println("Test 1\nTesting a lego mini with nothing named Paul, in winter and a threshold of 5:");
    LegoMini test1 = new LegoMini.Builder()
      .name("Paul")
      .build();
    System.out.println(test1.toString());
    System.out.print("Is it good? " + test1.isGood("winter", 5));
  
    System.out.println("\n\nTest 2\nTesting a lego mini with a sword named Paul, in winter and a threshold of 5:");
    LegoMini test2 = new LegoMini.Builder()
      .name("Paul")
      .leftHand(sword)
      .build();
    System.out.println(test2.toString());
    System.out.print("Is it good? " + test2.isGood("winter", 5));

    System.out.println("\n\nTest 3\nTesting a lego mini with sled and a tooth pick named Paul, in winter and a threshold of 5:");
    LegoMini test3 = new LegoMini.Builder()
      .name("Paul")
      .leftHand(sled)
      .rightHand(toothPick)
      .build();
    System.out.println(test3.toString());
    System.out.print("Is it good? " + test3.isGood("winter", 5));

    System.out.println("\n\nTest 4\nTesting a lego mini with a sun visor named Sarah, in summer and a threshold of 8:");
    LegoMini test4 = new LegoMini.Builder()
      .name("Sarah")
      .hat(sunVisor)
      .build();
    System.out.println(test4.toString());
    System.out.print("Is it good? " + test4.isGood("summer", 8));

    System.out.println("\n\nTest 5\nTesting a lego mini with a sun visor and a sword and a sled named Sarah, in winter and a threshold of 8:");
    LegoMini test5 = new LegoMini.Builder()
      .name("Sarah")
      .hat(sunVisor)
      .leftHand(sword)
      .rightHand(sled)
      .build();
    System.out.println(test5.toString());
    System.out.print("Is it good? " + test5.isGood("winter", 8));

    System.out.println("\n\nTest 6\nTesting a lego mini with a giant rock named Sarah, will it switch hands?:");
    LegoMini test6 = new LegoMini.Builder()
      .name("Sarah")
      .leftHand(giantRock)
      .build();
    System.out.println(test6.toString());
    test6.swapHands();
    System.out.println(test6.toString());
  
    System.out.println("\n\nTest 7\nTesting a lego mini with a giant rock and a sword named Ben, will it switch hands?:");
    LegoMini test7 = new LegoMini.Builder()
      .name("Ben")
      .leftHand(giantRock)
      .rightHand(sword)
      .build();
    System.out.println(test7.toString());
    test7.swapHands();
    System.out.println(test7.toString());
    
    System.out.println("\n\nTest 8\nTesting a lego mini with nothing named Ben, will it take things?:");
    LegoMini test8 = new LegoMini.Builder()
      .name("Ben")
      .build();
    System.out.println(test8.toString());
    test8.placeInLeftHand(toothPick);
    test8.placeInRightHand(sled);
    test8.wearHat(touque);
    System.out.println(test8.toString());
    
    System.out.println("\n\nTest 9\nTesting a lego mini with a toothpick and a sled wearing a touque named Ben, will it take things?:");
    LegoMini test9 = new LegoMini.Builder()
      .name("Ben")
      .leftHand(toothPick)
      .rightHand(sled)
      .hat(touque)
      .build();
    System.out.println(test9.toString());
    test9.placeInLeftHand(giantRock);
    test9.placeInRightHand(sword);
    test9.wearHat(floralHat);
    System.out.println(test9.toString());

    System.out.println("\n\nTest 10\nTesting a lego mini wearing a ballcap named Henry, will it be fasionable in fall? What about a floralhat in fall?:");
    LegoMini test10 = new LegoMini.Builder()
      .name("Henry")
      .hat(baseballCap)
      .build();
    System.out.println(test10.toString());
    System.out.println("Is it good? " + test10.isGood("fall", 10));
    test10.wearHat(floralHat);
    System.out.println(test10.toString());
    System.out.println("Is it good? " + test10.isGood("fall", 10));
  }
}
