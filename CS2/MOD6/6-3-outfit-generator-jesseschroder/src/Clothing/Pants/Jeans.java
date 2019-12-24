package Clothing.Pants;

public class Jeans extends Pants {
    public boolean casual() {
        return true;
    }

    public boolean athletic() {
        return false;
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
        return true;
    }

    public String toString() {
        return "Jeans";
    }
}
