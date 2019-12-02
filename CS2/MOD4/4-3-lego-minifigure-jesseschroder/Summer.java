public class Summer extends Season {
  
  Summer() {
    name = "summer";
  }

  public int compare(String season) {
    switch(season) {
      case "winter" :
        return 2;
      case "spring" :
        return 7;
      case "summer" :
        return 10;
      case "fall" :
        return 6;
      default :
        return 0;
    }
  } 
}

