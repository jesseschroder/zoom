public class LegoHat {
  String style;
  int size;
  Season season;

  LegoHat(String newStyle, int newSize, Season season) {
    style = newStyle;
    size = newSize;
    this.season = season;
  }

  public String toString() {
    return "a " + sizeToString() + style;
  }
  
  public String sizeToString() {
    String sizeStr = "n/a";
    switch(size) {
      case 1 :
        sizeStr = "small ";
        break;
      case 2 :
        sizeStr = "medium ";
        break;
      case 3 :
        sizeStr = "large ";
        break;
    }
    return sizeStr;
  }

  public int computeStyle(String seasonStr) {
   return this.season.compare(seasonStr);
  }
}
