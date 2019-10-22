String file_data[];
int file_size;

final String warning = "Error reading file";

void setup() {
    size(400, 300);
    textAlign(CENTER,CENTER);
    fill(0);
     file_data = loadStrings("example.txt");
    if (file_data == null) {
        text(warning, width/2, height/2);
    } else {
        file_size = file_data.length;
        text("This file is " + file_size + " lines long.", width/2, height/2);
    }
}
