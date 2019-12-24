package Clothing.Outerwear;

public class SpringCoat extends Outerwear {
    public String toString() {
        return "Spring Coat";
    }

    public boolean casual() {
        return true;
    }

    public boolean athletic() {
        return true;
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
