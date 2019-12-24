package Clothing;

import Clothing.Accessories.*;
import Clothing.Outerwear.*;
import Clothing.Pants.*;
import Clothing.Shirts.*;
import Clothing.Shoes.*;

public class Outfit {
    private Shirts top;
    private Pants bottom;
    private Shoes shoes;
    private Outerwear outW;
    private Accessories acc;

    Outfit() {
        this(new NullShirt(), new NullPants(), new NullShoes(), new NullOuterwear(), new NullAccessory());
    }

    Outfit(Shirts top, Pants bottom, Shoes shoes, Outerwear outW, Accessories acc) {
        this.top = top;
        this.bottom = bottom;
        this.shoes = shoes;
        this.outW = outW;
        this.acc = acc;
    }

    public Pants getBottom() { return bottom; }

    public Shirts getTop() {
        return top;
    }

    public Shoes getShoes() { return shoes; }

    public Outerwear getOutW() { return outW; }

    public Accessories getAcc() { return acc; }
}
