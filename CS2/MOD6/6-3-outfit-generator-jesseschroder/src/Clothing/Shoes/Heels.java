package Clothing.Shoes;

public class Heels extends Shoes {
    public String toString() {
        return "Heels";
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
}
