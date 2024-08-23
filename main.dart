//BALETE, GERALD P. 
//BMC, BSIT_303

// Song class with its instance variable or field named title, artist, and duration.
class Song {
  String title; 
  String artist;
  int duration; 

  //This constructor setup a song object with values to title, artist, and duration.
  Song(this.title, this.artist, this.duration);

  //This method formats and returns the song's title, artist, and duration in minutes:seconds format.
  String displayInfo() {
    int minutes = duration ~/ 60; 
    int seconds = duration % 60; 
    return '$title by $artist (${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')})';
  }
}

//This defines a Playlist class with a name and a list of Song objects.
class Playlist {
  String name;
  List<Song> songs = [];

  // Using a constructor to setup the Playlist (name).
  Playlist(this.name);

  // To add a song.
  void addSong(Song song) {
    songs.add(song);
  }

  // Displaying all the chosen songs.
  void displaySongs() {
    for (var song in songs) {
      print(song.displayInfo());
    }
  }

  // Calculate Playlist total duration in seconds.
  int totalDuration() {
    return songs.fold(0, (total, song) => total + song.duration);
  }

  //Sorting artist name by playlist.
  void sortByArtist() {
    songs.sort((a, b) => a.artist.compareTo(b.artist));
  }
}

//MusicFestival class with multiple playlists.
class MusicFestival {
  List<Playlist> playlists = [];

  // Add a playlist to the festival.
  void addPlaylist(Playlist playlist) {
    playlists.add(playlist);
  }

  // Calculate TotalDuration in seconds.
  int totalDuration() {
    return playlists.fold(0, (total, playlist) => total + playlist.totalDuration());
  }

  // Playlist with its random songs etc.
  void displayPlaylists() {
    print('Total Festival Duration (in seconds): ${totalDuration()} seconds');
    print('Random Songs:');
    for (var playlist in playlists) {
      print('${playlist.name}: ${playlist.songs.first.displayInfo()}');
    }
    print('');
  }

  // This part is for the displaySortedPlaylist.
  void displaySortedPlaylist(String playlistName) {
    var playlist = playlists.firstWhere((p) => p.name == playlistName);
    playlist.sortByArtist();
    print('Geralds Playlist: $playlistName');
    playlist.displaySongs();
  }
}

void main() {
  print('Welcome to the Geralds Music Festival Playlist Manager!');
  
  // This part are the songs that I chose with title, artist, and duration (in seconds).
  var song1 = Song('Big Dawgs', 'Hanumankind', 3 * 60 + 10); 
  var song2 = Song('Walk with Me', 'Bella Thorne', 3 * 60 + 24); 
  var song3 = Song('Here I Am To Worship', 'Reuben Morgan', 3 * 60 + 40); 
  var song4 = Song('Not Like Us', 'Kendrick Llamar', 4 * 60 + 34); 
  var song5 = Song('Last Christmas', 'Taylor Swift', 3 * 60 + 28); 

  var song6 = Song('Congratulations', 'Post Malone', 3 * 60 + 40); 
  var song7 = Song('Tim McGraw', 'Taylor Swift', 3 * 60 + 52); 

  // Playlist for the 5 songs I chose.
  var playlist1 = Playlist('Main Stage');
  playlist1.addSong(song1);
  playlist1.addSong(song2);
  playlist1.addSong(song3);
  playlist1.addSong(song4);
  playlist1.addSong(song5);

  var playlist2 = Playlist('Geralds Hip-hop/Rap Stage');
  playlist2.addSong(song6);

  var playlist3 = Playlist('Geralds Country Stage');
  playlist3.addSong(song7);

  var festival = MusicFestival();
  festival.addPlaylist(playlist1);
  festival.addPlaylist(playlist2);
  festival.addPlaylist(playlist3);

  // Display a summary of the festival's playlists and their songs.
  festival.displayPlaylists();

  // Display a specific playlist sorted by artist.
  festival.displaySortedPlaylist('Main Stage');
}