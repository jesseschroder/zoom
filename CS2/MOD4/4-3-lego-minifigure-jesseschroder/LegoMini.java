public class LegoMini {
  String name;
  LegoHat hat;
  LegoItem leftHand;
  LegoItem rightHand;

  LegoMini(Builder builder) {
    this.name = builder.name;
    this.hat = builder.hat;
    this.leftHand = builder.leftHand;
    this.rightHand = builder.rightHand;
  }

  public static class Builder {
    private String name = "Default Name";
    private LegoHat hat = null;
    private LegoItem leftHand = null;
    private LegoItem rightHand = null;

    public Builder name(String name) {
      this.name = name;
      return this;
    }

    public Builder hat(LegoHat hat) {
      this.hat = hat;
      return this;
    }

    public Builder leftHand(LegoItem leftHand) {
      this.leftHand = leftHand;
      return this;
    }

    public Builder rightHand(LegoItem rightHand) {
      this.rightHand = rightHand;
      return this;
    }
    public LegoMini build() {
      return new LegoMini(this);  
    }
  }

  public String toString() {
    String hatStr = (hat == null) ? "" : ", who is wearing " + hat.toString();
    String leftStr = (leftHand == null) ? "" : " and is holding " + leftHand.toString() + " in the left hand";
    String rightStr = (rightHand == null) ? "" : " and is holding " + rightHand.toString() + " in the right hand";
    return "A Lego minifigure named " + name + hatStr + leftStr + rightStr + ".";
  }
  
  public void swapHands() {
    LegoItem tempHand = leftHand;
    leftHand = rightHand;
    rightHand = tempHand;
  }

  public void wearHat(LegoHat newHat) {
    hat = newHat;
  }

  public void placeInLeftHand(LegoItem item) {
    leftHand = item;
  }

  public void placeInRightHand(LegoItem item) {
    rightHand = item;
  }

  public boolean isGood(String season, int threshold) {
    boolean leftBool = (leftHand == null) ? true : leftHand.isNotHeavy(threshold);
    boolean rightBool = (rightHand == null) ? true : rightHand.isNotHeavy(threshold);
    boolean hatBool = (hat == null) ? true : (hat.computeStyle(season) > 5);
    return (leftBool && rightBool && hatBool);
  }
}
