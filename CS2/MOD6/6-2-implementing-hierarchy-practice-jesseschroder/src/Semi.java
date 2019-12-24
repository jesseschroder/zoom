public class Semi extends Truck {

    Semi(String make, String model, int year) {
        super(make, model, year);
        numberOfWheels = 18;
    }

    public String doATrick() {
        return "That's pretty dangerous to do in a Semi. How about doing some work instead?";
    }

    public String doSomeWork() {
        return "The Semi picks up a large trailer and hauls it away!";
    }

    public String takeANap(){
        return "There's a nice bed in the back here, time to take a nap!";
    }
}
