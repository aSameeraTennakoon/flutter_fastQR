import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'splash.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(new HomePage());
}

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: SplashScreen());
  }
}




