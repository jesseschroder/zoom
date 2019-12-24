package Clothing.Outerwear;

public class WinterJacket extends Outerwear {
    public String toString() {
        return "Winter Jacket";
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
        return true;
    }

    public boolean wearInTheHeat() {
        return false;
    }
}
