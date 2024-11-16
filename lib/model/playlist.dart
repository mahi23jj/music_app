import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/pages/song.dart';

class PlaylistProvider extends ChangeNotifier {
  List<Song> playlist = [
    Song(SongName: 'Bayeshilgn', ArtistName: 'Amanucreation', AlbumArt: 'asset/1.jpg', SongUrl: 'asset/1m.mp3'),
    Song(SongName: 'freestyle', ArtistName: 'Lij Abe', AlbumArt: 'asset/2.jpg', SongUrl: 'asset/2m.mp3'),
    Song(SongName: 'Mashup', ArtistName: 'veronica ft. Lij micheal', AlbumArt: 'asset/3.jpg', SongUrl: 'asset/3m.mp3'),
  ];

  int? _currentIndex;
  int? get currentIndex => _currentIndex;

  final AudioPlayer audioPlayer = AudioPlayer();

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;

  PlaylistProvider() {
    listenToDuration();
  }

  set currentIndex(int? index) {
    if (index != null && index >= 0 && index < playlist.length) {
      _currentIndex = index;
      playSong();
    }
  }

  // Play the current song
  void playSong() async {
    if (_currentIndex == null) return;

    final String path = playlist[_currentIndex!].SongUrl;
    try {
      await audioPlayer.stop();
      await audioPlayer.play(AssetSource('asset/2m.mp3'));
      isPlaying = true;
      notifyListeners();
    } catch (e) {
      print("Error playing song: $e");
    }
  }

  // Pause the song
  void pauseSong() async {
    await audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  // Resume the song
  void resumeSong() async {
    await audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }

  // Toggle between pause and resume
  void togglePlayPause() {
    if (isPlaying) {
      pauseSong();
    } else {
      resumeSong();
    }
  }

  // Seek to a specific position in the current song
  void seekToPosition(Duration newPosition) async {
    await audioPlayer.seek(newPosition);
    notifyListeners();
  }

  // Play the next song
  void nextSong() {
    if (_currentIndex != null) {
      _currentIndex = (_currentIndex! + 1) % playlist.length; // Loop back to first song
      playSong();
    }
  }

  // Play the previous song
  void previousSong() {
    if (_currentIndex != null) {
      _currentIndex = (_currentIndex! - 1 + playlist.length) % playlist.length; // Loop back to last song
      playSong();
    }
  }

  // Listen for duration and position changes
  void listenToDuration() {
    audioPlayer.onDurationChanged.listen((event) {
      duration = event;
      notifyListeners();
    });

    audioPlayer.onPositionChanged.listen((event) {
      position = event;
      notifyListeners();
    });

    audioPlayer.onPlayerComplete.listen((event) {
      nextSong(); // Automatically play the next song when current completes
    });
  }
}
