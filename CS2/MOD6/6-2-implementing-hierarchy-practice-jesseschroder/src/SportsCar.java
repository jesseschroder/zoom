public class SportsCar extends Car {

    SportsCar(String make, String model, int year) {
        super(make, model, year);
        capacity = 2;
    }

    public String doATrick(){
        return "The sports car down an amazing burn out and drives away super quickly.";
    }

    public String dragRace() {
        return "Wow! That sports car just won the drag race!";
    }
}
