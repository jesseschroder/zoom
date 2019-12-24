package Clothing.Accessories;

public class FakeTatts extends Accessories {
    public boolean isJewelry() {
        return false;
    }

    public boolean isTie() {
        return false;
    }

    public String toString() {
        return "Fake Tattoos";
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
        return true;
    }
}
