package Clothing.Pants;

public class Slacks extends Pants {
    public String toString() {
        return "Slacks";
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
