package Clothing.Accessories;

public class Earrings extends Accessories {
    public boolean isJewelry() {
        return true;
    }

    public boolean isTie() {
        return false;
    }

    public String toString() {
        return "Pair of earrings";
    }

    public boolean casual() {
        return true;
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
