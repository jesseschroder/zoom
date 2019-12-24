public class TestClass {

    public static void main(String[] args) {
	Motorbike bike = new Motorbike("Honda", "CBR650", 2019, 650);
    System.out.println(bike.doATrick());

    Pickup pickup = new Pickup("Ford", "F250", 2015);
    System.out.println(pickup.doATrick());
    System.out.println(pickup.attachATrailer());

    SportsCar camaro = new SportsCar("Chevy", "Camaro Z28", 1969);
    System.out.println(camaro.howManyWillFit());
    System.out.println(camaro.addPerson());
    System.out.println(camaro.howManyWillFit());

    System.out.println(camaro.doATrick());

    Semi semi = new Semi("Mack", "T200", 1994);
    System.out.println(semi.doATrick());
    System.out.println(semi.doSomeWork());
    System.out.println(semi.takeANap());

    System.out.println(camaro.dragRace());

    System.out.println(camaro.getOccupancy());
    }
}
