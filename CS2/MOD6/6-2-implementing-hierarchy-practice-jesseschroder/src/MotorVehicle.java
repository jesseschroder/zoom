public class MotorVehicle {
    private String make, model;
    private int year;
    protected boolean oilClean;

    MotorVehicle(String make, String model, int year) {
        this.make = make;
        this.model = model;
        this.year = year;
        oilClean = true;
    }

    public String doATrick() {
        return "The engine starts for a moment, then sputters out.";
    }
}
