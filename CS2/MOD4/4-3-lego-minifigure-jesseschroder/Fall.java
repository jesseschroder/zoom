public class Fall extends Season {
  
  Fall() {
    name = "fall";
  }

  public int compare(String season) {
    switch(season) {
      case "winter" :
        return 8;
      case "spring" :
        return 3;
      case "summer" :
        return 5;
      case "fall" :
        return 10;
      default :
        return 0;
    }
  } 
}

