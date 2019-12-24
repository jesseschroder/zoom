public class SUV extends Car {

    SUV(String make, String model, int year){
        super(make, model, year);
        capacity = 6;
    }

    public String driveToSoccerPractice(int occupancy) {
        this.occupancy = occupancy;
        return "Okay! Let's load up the SUV with " + occupancy +" kids and head to soccer practice!";
    }
}
