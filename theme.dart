import 'package:flutter/material.dart';

class MyThemeData {
  static const lightBackgroundColor = Color.fromARGB(255, 223, 236, 219);
  static const darkBackgroundColor = Color.fromARGB(255, 6, 14, 30);
  static late ThemeData lightTheme = ThemeData(
      canvasColor: Color(0xFF1A1A1A),
      accentColor: Colors.white,
      scaffoldBackgroundColor: lightBackgroundColor,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ));
  static late final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: darkBackgroundColor,
      accentColor: Color.fromARGB(255, 20, 25, 34),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ));
}
