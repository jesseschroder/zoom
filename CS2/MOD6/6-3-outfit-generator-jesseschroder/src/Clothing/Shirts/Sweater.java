package Clothing.Shirts;

public class Sweater extends Shirts {
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
        return false;
    }

    public String toString() {
        return "Sweater";
    }

    public boolean wearWithTie() {
        return false;
    }
}
