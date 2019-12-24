package Clothing.Shirts;

public class Hoodie extends Shirts{
    public String toString() {
        return "Hoodie";
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

    public boolean wearWithTie() {
        return false;
    }
}
