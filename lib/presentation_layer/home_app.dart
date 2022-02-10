import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/model/pupular_response.dart';
import 'package:movies/movie_bloc/movie_cubit.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = 'HomeScreen';

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: BlocConsumer<MovieCubit, MovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Color(0xFF121312),
              appBar: MovieCubit.get(context).currentIndex != 0
                  ? AppBar(
                      backgroundColor: Color(0xFF121312),
                    )
                  : null,
              body: MovieCubit.get(context)
                  .screens[MovieCubit.get(context).currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: MovieCubit.get(context).currentIndex,
                backgroundColor: Theme.of(context).canvasColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(.60),
                onTap: (index) => MovieCubit.get(context).toggleScreens(index),
                items: [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(Icons.home_outlined),
                  ),
                  BottomNavigationBarItem(
                    label: 'Search',
                    icon: FaIcon(FontAwesomeIcons.search),
                  ),
                  BottomNavigationBarItem(
                    label: 'Browse',
                    icon: Icon(
                      Icons.wysiwyg,
                    ),
                  ),
                  BottomNavigationBarItem(
                      label: 'Wishlist', icon: FaIcon(FontAwesomeIcons.heart)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
