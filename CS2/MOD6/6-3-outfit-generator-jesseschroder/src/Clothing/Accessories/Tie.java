package Clothing.Accessories;

public class Tie extends Accessories {
    public boolean isJewelry() {
        return false;
    }

    public boolean isTie() {
        return true;
    }

    public String toString() {
        return "Tie";
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
        return true;
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
