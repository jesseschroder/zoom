package Clothing.Accessories;

public class Toque extends Accessories {
    public boolean isJewelry() {
        return false;
    }

    public boolean isTie() {
        return false;
    }

    public String toString() {
        return "Toque";
    }

    public boolean casual() {
        return true;
    }

    public boolean athletic() {
        return true;
    }

    public boolean dressy() {
        return false;
    }

    public boolean colourful() {
        return false;
    }

    public boolean plain() {
        return true;
    }

    public boolean wearInTheCold() {
        return true;
    }

    public boolean wearInTheHeat() {
        return false;
    }
}
