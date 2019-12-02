public class Winter extends Season {
  
  Winter() {
    name = "winter";
  }

  public int compare(String season) {
    switch(season) {
      case "winter" :
        return 10;
      case "spring" :
        return 6;
      case "summer" :
        return 3;
      case "fall" :
        return 7;
      default :
        return 0;
    }
  } 
}

