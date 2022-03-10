import 'package:flutter/material.dart';
import 'package:movies/presentation_layer/home_app.dart';
import 'package:movies/presentation_layer/movie_screens/film_details_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'movie_database.db'),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        FilmDetailsScreen.routeName: (context) => FilmDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
      theme: ThemeData(canvasColor: Color(0xFF1A1A1A)),
    );
  }
}
