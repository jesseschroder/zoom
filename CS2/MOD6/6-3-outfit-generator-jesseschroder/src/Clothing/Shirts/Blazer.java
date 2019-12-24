package Clothing.Shirts;

public class Blazer extends Shirts{
    public String toString() {
        return "Blazer";
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

    public boolean wearWithTie() {
        return true;
    }
}
