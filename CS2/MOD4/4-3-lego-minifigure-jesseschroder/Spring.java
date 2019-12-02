public class Spring extends Season {
  
  Spring() {
    name = "spring";
  }

  public int compare(String season) {
    switch(season) {
      case "winter" :
        return 8;
      case "spring" :
        return 10;
      case "summer" :
        return 7;
      case "fall" :
        return 2;
      default :
        return 0;
    }
  } 
}

