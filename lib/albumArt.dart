import 'package:flutter/material.dart';

class AlbumArt extends StatelessWidget {
  final bool art;
  const AlbumArt({Key key, this.art}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 295,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
          color: Color(0xff0da8f4),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black38.withAlpha(70),
                offset: Offset(20, 20),
                blurRadius: 15,
                spreadRadius: 2)
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: art == true
              ? Image.asset(
                  'assets/img.jpg',
                  fit: BoxFit.fill,
                )
              : null //Image.asset(
          //     'assets/play.png',
          //     colorBlendMode: BlendMode.multiply,
          //     scale: 0.25,
          //     fit: BoxFit.fill,
          //   )
          ),
    );
  }
}
