package Clothing.Shirts;

public class Shirtless extends Shirts{
    public String toString() {
        return "Nothing (shirtless)";
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

    public boolean wearWithTie() {
        return false;
    }
}
