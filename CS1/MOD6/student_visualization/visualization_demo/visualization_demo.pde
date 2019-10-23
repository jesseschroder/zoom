String[] countryNames;
int[] numQ1_2013;
int[] numQ2_2013;
int[] numQ3_2013;
int[] numQ4_2013;
int[] numTotal_2013;
int[] numQ1_2014;
int[] numYTD_2014;

final String filename = "foreign-student-data.csv";

void setup() {
    String[] lines = loadStrings(filename);
    int numCountries = lines.length - 6;

    countryNames = new String[numCountries];
    numQ1_2013 = new int[numCountries];
    numQ2_2013 = new int[numCountries];
    numQ3_2013 = new int[numCountries];
    numQ4_2013 = new int[numCountries];
    numTotal_2013 = new int[numCountries];
    numQ1_2014 = new int[numCountries];
    numYTD_2014 = new int[numCountries];

    int lineIndex = 0;
    while (lineIndex < lines.length) {
        if (lineIndex < 3 || lineIndex >= lines.length - 3) {
            lineIndex++;
            continue;
        }
        int countryNum = lineIndex - 3;
        String[] splitLine = lines[lineIndex].split(",");

        countryNames[countryNum] = splitLine[0];
        numQ1_2013[countryNum] = Integer.parseInt(splitLine[1]);
        numQ2_2013[countryNum] = Integer.parseInt(splitLine[2]);
        numQ3_2013[countryNum] = Integer.parseInt(splitLine[3]);
        numQ4_2013[countryNum] = Integer.parseInt(splitLine[4]);
        numTotal_2013[countryNum] = Integer.parseInt(splitLine[5]);
        numQ1_2014[countryNum] = Integer.parseInt(splitLine[6]);
        numYTD_2014[countryNum] = Integer.parseInt(splitLine[7]);
        
        lineIndex++;
    }
}