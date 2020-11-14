import 'package:flutter/material.dart';
import 'package:primer_chapoteo/features/splash_screen.dart';

void main() {
  runApp(new MaterialApp(
    theme: new ThemeData(
      primaryColor: Colors.white
    ),
    home: SplashScreen(),
  ));
}