public class TestScotchTape {
  public static void main(String[] args){
    final byte numTapes = 3;
    ScotchTape tapes[] = new ScotchTape[numTapes];

    tapes[0] = new ScotchTape();
    tapes[0].colour = "clear";
    tapes[0].weight = 3;
    tapes[0].height = 22;
    
    tapes[1] = new ScotchTape();
    tapes[1].colour = "green";
    tapes[1].weight = 1;
    tapes[1].height = 15;
    
    tapes[2] = new ScotchTape();
    tapes[2].colour = "blue";
    tapes[2].weight = 2;
    tapes[2].height = 19;
    
    printTapeArray(tapes, numTapes);

    stickTape(tapes[0], 0.5);
    stickTape(tapes[1], 0.3);
    stickTape(tapes[2], 0.9);

    System.out.println();
    printTapeArray(tapes, numTapes);
  }

  public static void printTapeArray(ScotchTape[] tapes, int length) {
    for (int i = 0; i < length; i++) {
      System.out.print(tapes[i].colour + " (" + tapes[i].height + " cm, " + tapes[i].weight + "oz)");
      System.out.println();
    }
  }

  public static void stickTape(ScotchTape tape, double percentToUse) {
    tape.weight -= tape.weight * percentToUse;
    tape.height -= tape.height * percentToUse;
  }
}  
