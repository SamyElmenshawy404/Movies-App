import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation_layer/movie_screens/browse_screen.dart';
import 'package:movies/presentation_layer/movie_screens/home_screen.dart';
import 'package:movies/presentation_layer/movie_screens/search_screen.dart';
import 'package:movies/presentation_layer/movie_screens/watchlist_screen.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    searchScreen(),
    browseScreen(),
    WatchListScreen(),
  ];

  MovieCubit() : super(MovieInitial());

  static MovieCubit get(BuildContext context) => BlocProvider.of(context);

  void toggleScreens(int index) {
    currentIndex = index;
    emit(ChangeScreen());
    print('in on tap');
  }
}
