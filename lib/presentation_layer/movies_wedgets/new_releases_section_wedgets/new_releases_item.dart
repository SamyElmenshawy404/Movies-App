import 'package:flutter/material.dart';
import 'package:movies/model/pupular_response.dart';

class NewReleasesItem extends StatelessWidget {
  Popular popular;

  NewReleasesItem(this.popular);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'https://image.tmdb.org/t/p/w500/${popular.posterPath}',
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
    );
  }
}
