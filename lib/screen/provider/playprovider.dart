import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class provider extends ChangeNotifier {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  int temp = 0;
  int mno = 0;
  bool ismusic = false;
  Duration musictime = Duration(seconds: 0);

  void initMusic() {
    audioPlayer.open(Audio("assets/audio/music1.mp3"),
        autoStart: false, showNotification: true);
    notifyListeners();
  }

  void musicrun() {
    if (audioPlayer.isPlaying.value) {
      pausemusic();
    } else {
      playmusic();
    }
  }

  void initmusic() {
    audioPlayer.open(
        Playlist(audios: [
          Audio("assets/audio/music1.mp3"),
        ], startIndex: 0),
        autoStart: false,
        showNotification: true,
        loopMode: LoopMode.playlist);
    musiclength();
    temp = mno;
    notifyListeners();
  }

  void pausemusic() {
    audioPlayer.pause();
    ismusic = true;
    notifyListeners();
  }

  void playmusic() {
    audioPlayer.play();
    ismusic = false;
    notifyListeners();
  }

  void musiclength() {
    audioPlayer.current.listen((event) {
      musictime = event!.audio.duration;
      notifyListeners();
    });
  }
}
