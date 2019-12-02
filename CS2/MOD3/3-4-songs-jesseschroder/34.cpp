#include <iostream>
#include <string>
#include <sstream>

using namespace std;

struct song {
  string title;
  string artist;
  int release;
};

song ** songsFromYear(song **songs, int size, int year, int* resultSize);
string songToString(song s);
void songDeleteFromArray(song ** songs, int arraySize);

int main() {
  /////////////
  // Variables
  /////////////
  
  const int songCount = 5;
  int resultSize = 0;
  int yearInput;
  song ** songPointers = new song*[songCount];
  song ** yearPointers;
  
  //////////////
  // Create the
  // song array
  //////////////

  for (int i = 0; i < songCount; i++) songPointers[i] = new song;
  *songPointers[0] = (song) {"Death by Techno", "i_o", 2019};  
  *songPointers[1] = (song) {"Ghosts 'n' Stuff", "Deadmau5", 2008};  
  *songPointers[2] = (song) {"Made For You (Alone Again)", "Getter", 2018};  
  *songPointers[3] = (song) {"Purgatory", "Getter", 2019};  
  *songPointers[4] = (song) {"Front", "Callie Reiff", 2019};

  //////////////
  // Output all
  // songs & ask
  // for input
  //////////////
  
  for (int i = 0; i < songCount; i++) cout << songToString(*songPointers[i]);
  cout << "What year of songs do you want to see? (enter a number) ";
  cin >> yearInput;
  
  //////////////
  // Search for
  // songs matching
  // input year
  //////////////
  
  yearPointers = songsFromYear(songPointers, songCount, yearInput, &resultSize);

  //////////////
  // Output answer
  //////////////
  
  if (resultSize > 0) {
    for (int i = 0; i < resultSize; i++) cout << endl << songToString(*yearPointers[i]);
  } else {
    cout << "Oops! Doesn't look like there are any songs that year." << endl;
  }

  //////////////
  // clean up
  //////////////
  
  songDeleteFromArray(songPointers, songCount);
  delete[] songPointers;
  delete[] yearPointers;

  return 0;
}

song ** songsFromYear(song **songs, int size, int year, int* resultSize) {
  int tempCount = 0;
  int count = 0;

  for (int i = 0; i < size; i++) {
    if ((*songs[i]).release == year) tempCount++;
  }
  *resultSize = tempCount;

  song ** yearSongs = new song*[*resultSize];

  for (int i = 0; i < size; i++) {
    if ((*songs[i]).release == year) yearSongs[count++] = songs[i];
  }

  return yearSongs;
}

string songToString(song s) {
  stringstream songInfo;

  songInfo << "Song Title: \t" << s.title << '\n';
  songInfo << "Artist: \t" << s.artist << '\n';
  songInfo << "Released in: \t" << s.release << "\n\n";
  
  return songInfo.str();
}

void songDeleteFromArray(song ** songs, int arraySize) {
  for (int i = 0; i < arraySize; i++) {
    delete songs[i];
  }
}

