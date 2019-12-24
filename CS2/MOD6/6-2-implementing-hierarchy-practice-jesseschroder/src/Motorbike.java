public class Motorbike extends MotorVehicle {
    private int cc;

    Motorbike(String make, String model, int year, int cc) {
        super(make, model, year);
        this.cc = cc;
    }

    public String doATrick() {
        return "Wow, that person just popped a wheelie!";
    }

    public int getCc() { return cc; }
}
