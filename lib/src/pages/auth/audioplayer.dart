import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

class AudioPlayerHH extends StatefulWidget {
  @override
  _AudioPlayerHHState createState() => _AudioPlayerHHState();
}

class _AudioPlayerHHState extends State<AudioPlayerHH> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  List<String> path = [
    'audios/audio1.mp3',
    'audios/audio2.mp3',
    'audios/audio3.mp3',
    'audios/audio4.mp3',
    'audios/audio5.mp3'
  ];
  //String path = 'audios/bien.mp3';

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
    final _random = new Random();
    var random_audio = path[_random.nextInt(path.length)];
    await audioCache.play(random_audio);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("¡Estamos aquí para ti!",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
              SizedBox(height: size.height * 0.05),
              Text("Escucha algunas palabras reconfortantes más abajo",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0)),
              SizedBox(height: size.height * 0.05),
              Image(
                image: AssetImage('assets/images/teddybear.png'),
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.05),
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
        ),
      ],
    ));
  }
}
