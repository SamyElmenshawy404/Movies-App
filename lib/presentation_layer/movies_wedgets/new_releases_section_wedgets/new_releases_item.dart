import 'package:flutter/material.dart';
import 'package:movies/model/TopRatedResponse.dart';
import 'package:movies/presentation_layer/movie_screens/film_details_screen.dart';

class NewReleasesItem extends StatelessWidget {
  TopRated topRated;

  NewReleasesItem(this.topRated);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(FilmDetailsScreen.routeName,
            arguments: NewReleasesItem(topRated));
      },
      child: Container(
        width: 85,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500/${topRated.posterPath}',
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/bookmark.png',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
