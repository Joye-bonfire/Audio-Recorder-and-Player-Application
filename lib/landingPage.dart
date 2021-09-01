import 'package:Anantha/recorder.dart';
import 'package:flutter/material.dart';
import 'package:Anantha/albumArt.dart';
import './playerPage.dart';

import './navigationDrawerWidget.dart';

class LandingPage extends StatelessWidget {
  //const LandingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xb30da8f4),
              Color(0x8c0da8f4),
              Color(0xb30da8f4),
              Color(0xd90da8f4),
              Color(0xf10da8f4),
            ]),
      ),
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            "Anantha",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text(
                'Start Playing',
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
              InkWell(
                child: AlbumArt(
                  art: false,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayerPage()));
                },
              ),
              Text(
                'I knew you\'d Comeback ;-)',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 83,
              ),
              Recorder(),
            ],
          ),
        ),
      ),
    );
  }
}
