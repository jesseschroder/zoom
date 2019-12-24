package Clothing.Accessories;

public class HairPin extends Accessories {
    public boolean isJewelry() {
        return false;
    }

    public boolean isTie() {
        return false;
    }

    public String toString() {
        return "A hair pin";
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
