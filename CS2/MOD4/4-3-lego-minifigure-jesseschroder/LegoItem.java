public class LegoItem {
  String name;
  int weight;

  LegoItem(String newName, int newWeight) {
    name = newName;
    weight = newWeight;
  }

  public String toString() {
    return "a " + weight + "-gram " + name;
  }

  public boolean isNotHeavy(int threshold) {
    return (weight < threshold);
  }
}
