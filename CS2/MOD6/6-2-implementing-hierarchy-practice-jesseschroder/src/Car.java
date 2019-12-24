public class Car extends MotorVehicle{
    protected int capacity, occupancy;

    Car(String make, String model, int year){
        super(make, model, year);
    }

    public boolean addPerson() {
        if (occupancy < capacity) {
            occupancy++;
            return true;
        }
        return false;
    }

    public boolean removePerson() {
        if (occupancy > 0) {
            occupancy--;
            return true;
        }
        return false;
    }

    public String getCapacity() {
        return "This car can hold a total of " + capacity + " people.";
    }

    public String getOccupancy() {
        return "There are currently " + occupancy + " in this car.";
    }

    public String howManyWillFit() {
        return (capacity - occupancy) + " will currently fit in the car";
    }
}
