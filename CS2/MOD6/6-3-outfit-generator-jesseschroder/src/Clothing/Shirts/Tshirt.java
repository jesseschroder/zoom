package Clothing.Shirts;

import Clothing.Clothing;
import Clothing.Shirts.Shirts;

public class Tshirt extends Shirts {

    public boolean casual() { return true; }

    public boolean athletic() { return true; }

    public boolean dressy() {
        return false;
    }

    public boolean colourful() {
        return true;
    }

    public boolean plain() {
        return true;
    }

    public boolean wearInTheCold() {
        return false;
    }

    public boolean wearInTheHeat() {
        return true;
    }

    public String toString() {
        return "T Shirt";
    }

    public boolean wearWithTie() {
        return false;
    }
}
