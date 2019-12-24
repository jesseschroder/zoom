package Clothing.Pants;

public class Skirt extends Pants {
    public String toString() {
        return "Skirt";
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
        return false;
    }

    public boolean wearInTheHeat() {
        return true;
    }
}
