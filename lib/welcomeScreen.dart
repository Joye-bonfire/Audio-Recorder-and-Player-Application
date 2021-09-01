import 'package:Anantha/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:Anantha/signUpPage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff9ABED8),
                  Color(0xffB7D2E5),
                  Color(0xffD9EBF5),
                  Color(0xff90B3D1),
                  Color(0xd890B3D1),
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 140,
              ),
              Container(
                height: 300,
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Colors.transparent,
                child: Text(
                  "\"There's always room for a story that can transport people to another place.\" --J.K. Rowling",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 140,
              ),
              Container(
                height: 300,
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffE6F1F7),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 80),
                    TextButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24))),
                          backgroundColor:
                              MaterialStateProperty.all(Color((0xff4A6075))),
                          fixedSize: MaterialStateProperty.all(Size(180, 60))),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage())),
                      child: Text(
                        "Get started",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      child: Text(
                        "All ready have an account?\t Let's hop right on",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
