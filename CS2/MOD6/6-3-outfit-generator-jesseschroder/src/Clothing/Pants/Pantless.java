package Clothing.Pants;

public class Pantless extends Pants{
    public String toString() {
        return "Nothing (pantless)";
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
