import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import './main.dart';
import './methods.dart';
import './episodes.dart';

//import 'package:audioplayers/audiocache';

class PlayerControls extends StatefulWidget {
  //const PlayerControls({ Key? key }) :// super(key: key);
  @override
  _PlayerControlsState createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {
  List<Reference> references;
  bool playing = false;
  IconData playButtton = Icons.play_circle_fill_rounded;
  int i = 0;

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  String url;
  String selectedValue = 'Hindi';
  List<String> language = ['Hindi', 'Marathi', 'Gujarati'];

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;
  void forwardBackward(int j) async {
    url = await references[j % references.length].getDownloadURL();
  }

  Map mapurl = {};

  void getFirebaseFolder(int j) async {
    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('upload-voice-firebase_$selectedValue');
    storageReference.listAll().then((result) async {
      print(result.toString());
      references = result.items;
      i = j % references.length;
      url = await references[i].getDownloadURL();
      print(url);
    });
    // FirebaseDatabase.instance
    //     .reference()
    //     .child('uploads')
    //     .once()
    //     .then((DataSnapshot data) {
    //   print(data.value);
    //   List<Episodes> episode;
    //   Map<dynamic, dynamic> mapValue = data.value;
    //   mapValue.forEach((key, mapValue) {
    //     episode.add(Episodes.fromSnapshot(mapValue));
    //   });
  }

  /// Optional
  Widget slider() {
    return Container(
      width: 400.0,
      child: Slider.adaptive(
          activeColor: Colors.white,
          inactiveColor: Colors.white38,
          value: timeProgress.toDouble(),
          max: audioDuration.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3';
    getFirebaseFolder(i);
    selectedValue;

    /// Compulsory
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
    });

    /// Optional
    audioPlayer.setUrl(
        url); // Triggers the onDurationChanged listener and sets the max duration string
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inSeconds;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration position) async {
      setState(() {
        timeProgress = position.inSeconds;
      });
    });
  }

  /// Compulsory
  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  /// Compulsory
  playMusic() async {
    // Add the parameter "isLocal: true" if you want to access a local file
    await audioPlayer.play(url);
  }

  /// Compulsory
  pauseMusic() async {
    await audioPlayer.pause();
  }

  /// Optional
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer
        .seek(newPos); // Jumps to the given position within the audio file
  }

  /// Optional
  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
          hint: Text('Please choose a language'),
          value: selectedValue,
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
              getFirebaseFolder(i);
            });
          },
          items: language.map((lang) {
            return DropdownMenuItem(
              child: new Text(lang),
              value: lang,
            );
          }).toList(),
        ),
        slider(),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.repeat_rounded,
                  color: Colors.white70,
                ),
                iconSize: 30,
                onPressed: () {
                  //initAudio();
                  //value = 1;
                },
              ),
              // SizedBox(width: 10),
              IconButton(
                icon: Icon(
                  Icons.skip_previous_rounded,
                  color: Colors.white,
                ),
                iconSize: 60,
                onPressed: () {
                  forwardBackward(i--);
                  playMusic();
                  print(url);
                },
              ),
              // SizedBox(width: 10),
              IconButton(
                icon: Icon(
                  playButtton,
                  color: Colors.white,
                ),
                iconSize: 60,
                onPressed: () {
                  if (!playing) {
                    setState(() {
                      //cache.play("test.mp3");
                      // audioPlayer
                      //     .play(references[0].getDownloadURL().toString());
                      playMusic();
                      playButtton = Icons.pause_circle_filled_rounded;
                      playing = true;
                    });
                  } else {
                    setState(() {
                      pauseMusic();
                      //audioPlayer.pause();
                      // audioPlayer.play(
                      //     'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3');
                      playButtton = Icons.play_circle_filled_rounded;
                      playing = false;
                    });
                  }
                },
              ),
              // SizedBox(width: 10),
              IconButton(
                icon: Icon(
                  Icons.skip_next_rounded,
                  color: Colors.white,
                ),
                iconSize: 60,
                onPressed: () {
                  forwardBackward(i++);
                  playMusic();
                  print(url);
                },
              ),
              // SizedBox(width: 10),
              IconButton(
                icon: Icon(
                  Icons.shuffle_rounded,
                  color: Colors.white70,
                ),
                iconSize: 30,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.report_off_rounded,
                  color: Colors.white,
                ),
                iconSize: 30,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
