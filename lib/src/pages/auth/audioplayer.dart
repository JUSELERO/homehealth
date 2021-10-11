import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

class AudioPlayerHH extends StatefulWidget {
  @override
  AudioPlayerHHState createState() => AudioPlayerHHState();
}

class AudioPlayerHHState extends State<AudioPlayerHH> {
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _saveActivity(context),
          child: Icon(Icons.call),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.pink,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(25),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("¡Estamos aquí para ti!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0)),
                    SizedBox(height: size.height * 0.05),
                    Text("Escucha algunas palabras reconfortantes más abajo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20.0)),
                    SizedBox(height: size.height * 0.05),
                    Image(
                      image: AssetImage('assets/images/relax.png'),
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
                      icon: Icon(
                        audioPlayerState == AudioPlayerState.PLAYING
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: Colors.blue,
                      ),
                    ),
                    Text("Date un respiro. Dale play.",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20.0)),
                    ElevatedButton(onPressed: () {}, child: Text('Boton'))
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> _saveActivity(BuildContext context) {
    Navigator.pushNamed(context, "contacts2");
    // return showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   useSafeArea: false,
    //   useRootNavigator: false,
    //   builder: (BuildContext context) => AlertDialog(
    //     title: Text('Success!'),
    //     content: Text('You are in the football universe!'),

    //   )
    // );
  }
}
