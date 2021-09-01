import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import './welcomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
        theme: ThemeData(primaryColorDark: Colors.black38),
        home: WelcomeScreen()),
  );
}

final DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("users");

final DatabaseReference uploads =
    FirebaseDatabase.instance.reference().child("uploads");
