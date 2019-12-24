package Clothing.Shirts;

public class NiceDress extends Shirts {
    public String toString() {
        return "Dress";
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
        return false;
    }

    public boolean wearInTheHeat() {
        return true;
    }

    public boolean wearWithTie() {
        return false;
    }
}
