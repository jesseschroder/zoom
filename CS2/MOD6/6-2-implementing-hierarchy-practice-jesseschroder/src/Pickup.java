public class Pickup extends Truck {

    Pickup(String make, String model, int year) {
        super(make, model, year);
        numberOfWheels = 4;
    }

    public String doATrick() {
        return "The truck drives through a bunch of mud, spraying everyone behind them!";
    }
}
