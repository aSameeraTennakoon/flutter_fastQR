import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fast_qr_scan/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds:3);
    return new Timer(_duration, navigationPage);
  }


  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    print("drawing splash scaffold");
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//              SizedBox(height: 250.0),
            Container(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: FadeAnimatedTextKit(
                        text:[" Fast QR Scanner"
                        ],
                        textStyle:TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 50.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        alignment: AlignmentDirectional.topCenter,
                        totalRepeatCount:1,
                        isRepeatingAnimation: false,
                        pause:Duration(milliseconds: 3000),



                      ),
                    ),
                    SizedBox(height: 200),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                CircularProgressIndicator(
//                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                ),
                SizedBox(height: 20.0),
              ],
            )
          ],
        ),


      ),
    );
  }
}