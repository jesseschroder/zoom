package Clothing.Accessories;

public class DiamondNecklace extends Accessories {
    public boolean isJewelry() {
        return true;
    }

    public boolean isTie() {
        return false;
    }

    public String toString() {
        return "Diamond Necklace";
    }

    public boolean casual() {
        return false;
    }

    public boolean athletic() {
        return false;
    }

    public boolean dressy() {
        return true;
    }

    public boolean colourful() {
        return false;
    }

    public boolean plain() {
        return false;
    }

    public boolean wearInTheCold() {
        return true;
    }

    public boolean wearInTheHeat() {
        return true;
    }
}
