package Clothing.Outerwear;

public class BeerHat extends Outerwear {
    public String toString() {
        return "Beer hat";
    }

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
}
