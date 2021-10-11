import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class AudioPlayerHH extends StatefulWidget {
  @override
  AudioPlayerHHState createState() => AudioPlayerHHState();
}

class AudioPlayerHHState extends State<AudioPlayerHH> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  String path = 'audios/bien.mp3';

  @override
  void initState() {
    super.initState();

    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
  }

  playMusic() async {
    await audioCache.play(path);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 50,
            onPressed: () {
              audioPlayerState == AudioPlayerState.PLAYING
                  ? pauseMusic()
                  : playMusic();
            },
            icon: Icon(audioPlayerState == AudioPlayerState.PLAYING
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded),
          )
        ],
      ),
    ));
  }
}
