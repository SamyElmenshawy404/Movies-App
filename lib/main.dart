import 'package:flutter/material.dart';
import 'package:movies/presentation_layer/home_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
      initialRoute: HomeScreen.routeName,
      theme: ThemeData(canvasColor: Color(0xFF1A1A1A)),
    );
  }
}
