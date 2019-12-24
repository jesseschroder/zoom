package Clothing.Pants;

public class Khakis extends Pants {
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
        return false;
    }

    public String toString() {
        return "Khakis";
    }
}
