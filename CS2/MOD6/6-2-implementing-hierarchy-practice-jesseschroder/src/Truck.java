public class Truck extends MotorVehicle {
    protected int numberOfWheels;

    Truck(String make, String model, int year) {
        super(make, model, year);
    }

    public String attachATrailer() {
        return "Trailer Attached!";
    }
}
