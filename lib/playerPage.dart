import 'package:Anantha/loginScreen.dart';
import 'package:flutter/material.dart';
import './NavigationBar.dart ';
import 'albumArt.dart';
import './PlayerControls.dart';

class PlayerPage extends StatefulWidget {
  //HomePage const ({ Key? key }) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0x660da8f4),
              Color(0x8c0da8f4),
              Color(0xb30da8f4),
              Color(0xd90da8f4),
              Color(0xff0da8f4),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavigationBar(),
            Container(
              height: 350,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return AlbumArt(
                    art: true,
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Text(
              'Track Name',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            PlayerControls(),
            SizedBox(height: 10),
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
