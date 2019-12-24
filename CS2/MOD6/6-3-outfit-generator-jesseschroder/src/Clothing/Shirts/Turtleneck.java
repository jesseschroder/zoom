package Clothing.Shirts;

public class Turtleneck  extends Shirts{
    public String toString() {
        return "Turtleneck";
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
        return false;
    }

    public boolean wearWithTie() {
        return false;
    }
}
