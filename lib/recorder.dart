import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import './main.dart';
import 'package:record/record.dart';

class Recorder extends StatefulWidget {
  const Recorder({
    Key key,
  }) : super(key: key);
  @override
  _RecorderState createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  String statusText = "";
  int index = 0;
  String path;
  bool isCompleted = false;
  bool _isUploading = false;
  IconData playButton = Icons.radio_button_on;
  String selectedValue = 'Hindi';
  List<String> language = ['Hindi', 'Marathi', 'Gujarati'];
  final _record = Record();
  var playpause;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "To Start Recording Swipe Up",
            ),
            Text("And Let the world Hear your Beautiful Voice"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      stopRecord();
                    });
                  },
                  icon: Icon(Icons.cancel_outlined),
                  iconSize: 50,
                ),
                IconButton(
                  icon: Icon(
                    playButton,
                    color: Colors.red,
                  ),
                  iconSize: 100,
                  onPressed: () {
                    if (isCompleted == true) {
                      playButton = Icons.radio_button_on;
                      setState(() {
                        startRecord();
                      });
                    } else {
                      if (playButton == Icons.pause_circle) {
                        setState(() {
                          pauseRecord();
                        });
                        playButton = Icons.play_arrow;
                      } else if (playButton == Icons.play_arrow) {
                        setState(() {
                          resumeRecord();
                        });
                        playButton = Icons.pause_circle;
                      } else {
                        setState(() {
                          startRecord();
                        });
                        playButton = Icons.pause_circle;
                      }
                    }
                  },
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      stopRecord();
                    });
                    playButton = Icons.radio_button_on;
                  },
                  icon: Icon(Icons.stop_circle_outlined),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      //_onFileUploadButtonPressed();
                    });
                  },
                  icon: Icon(Icons.upload),
                  iconSize: 50,
                ),
              ],
            ),
            DropdownButton(
              hint: Text('Please choose a language'),
              value: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              items: language.map((lang) {
                return DropdownMenuItem(
                  child: new Text(lang),
                  value: lang,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

//   DropdownButton<String>(items:language.map((String dropDownStringItem){
//     return DropdownMenuItem<String>(value: dropDownStringItem,child:Text(dropDownStringItem));
//   }).tolist();
  // Future<bool> checkPermission() async {
  //   if (!await Permission.microphone.isGranted) {
  //     PermissionStatus status = await Permission.microphone.request();
  //     if (status != PermissionStatus.granted) {
  //       return false;
  //     }
  //   }
  //   return true;
  // }

  void startRecord() async {
    if (await _record.hasPermission()) {
      _record.start(path: await getFilePath());
      index = 1;
    }
  }

  void pauseRecord() async {
    if (await _record.isRecording()) {
      _record.pause();
    }
  }

  void stopRecord() async {
    if (await _record.isRecording()) {
      path = await _record.stop();
      stdout.writeln(path);
      isCompleted = true;
    }
  }

  void resumeRecord() async {
    if (await _record.isPaused()) {
      _record.resume();
    }
  }

  // String recordFilePath;

  // void play() {
  //   if (recordFilePath != null && File(recordFilePath).existsSync()) {
  //     AudioPlayer audioPlayer = AudioPlayer();
  //     audioPlayer.play(recordFilePath, isLocal: true);
  //   }
  // }

  int i = 0;
  var d;
  Future<String> getFilePath() async {
    Directory storageDirectory = await getExternalStorageDirectory();
    String sdPath = storageDirectory.path + "/record";
    d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/myRecording_${i++}.mp3";
  }

  Future<void> _onFileUploadButtonPressed() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    setState(() {
      _isUploading = true;
    });
    try {
      TaskSnapshot taskSnapshot = await firebaseStorage
          .ref('upload-voice-firebase_$selectedValue')
          .child('myRecording_${i}.mp3')
          .putFile(File(path));
      String url = await taskSnapshot.ref.getDownloadURL();

      Map userDataMap = {
        'userid': 'ntOP3VeC0TSgYrR00VMZ4DkinCA2',
        'url': url,
        'flag': false,
        'language': selectedValue,
      };

      uploads.child('9834567890').set(userDataMap);
    } catch (error) {
      print('Error occured while uplaoding to Firebase ${error.toString()}');
      print((getFilePath()));
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }
}
