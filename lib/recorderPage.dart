import 'package:flutter/material.dart';
import 'package:Anantha/recorder.dart';

class RecorderPage extends StatelessWidget {
  const RecorderPage({Key key}) : super(key: key);

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "To Start Recording Swipe Up",
          ),
          Text("And Let the world Hear your Beautiful Voice"),
          IconButton(
            icon: Icon(
              Icons.radio_button_on,
              color: Colors.red,
            ),
            iconSize: 100,
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}
