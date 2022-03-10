import 'package:flutter/material.dart';
import 'package:movies/model/MovieDetails.dart';
import 'package:movies/network/remote/api_manager.dart';
import 'package:movies/presentation_layer/movies_wedgets/get_similar_section/get_similar_section.dart';

import '../movies_wedgets/new_releases_section_wedgets/new_releases_item.dart';

class FilmDetailsScreen extends StatelessWidget {
  static final String routeName = 'filmDetailsScreen';

  Widget generesGridView(List<Genres>? genres) {
    return Container(
      height: 80,
      width: 260,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 5,
            childAspectRatio: 6.5 / 2.5),
        itemBuilder: (context, index) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text(genres![index].name!,
              style: TextStyle(color: Colors.white, fontSize: 10)),
        ),
        itemCount: genres!.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NewReleasesItem;
    List<Genres>? genres;
    return Scaffold(
        appBar: AppBar(
            title: Text(
              args.topRated.title!,
              style: TextStyle(),
            ),
            backgroundColor: Color(0xFF121312),
            centerTitle: true),
        body: FutureBuilder<MovieDetails>(
            future: ApiManager.getDetails(args.topRated),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                genres = snapshot.data!.genres;
                print('has data');
                int? runtime = snapshot.data!.runtime;
                int? hours = (runtime! ~/ 60);
                int? min = (runtime % 60);
                print('runtime:$runtime  min:$min hours:$hours');
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .25,
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${snapshot.data!.backdropPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10, top: 15),
                        child: Text(
                          snapshot.data!.title ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20, bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data!.releaseDate ?? '',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                snapshot.data!.adult == true ? 'PG-13' : 'R',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${hours}h ${min}m ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      Container(
                        height: 245,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 20, bottom: 5, top: 7, right: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Image.network(
                                    'https://image.tmdb.org/t/p/w500/${snapshot.data!.posterPath}',
                                    fit: BoxFit.cover,
                                    height: 220,
                                    width: 140,
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  generesGridView(snapshot.data!.genres),
                                  Container(
                                    child: Text(snapshot.data!.overview!,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                        maxLines: 5),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 32,
                                          color: Colors.amberAccent,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          snapshot.data!.voteAverage.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SimilarSection(args.topRated),
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                //Todo:in case Error retry
                return Center(child: Text('${snapshot.error}'));
              }

              return Center(child: const CircularProgressIndicator());
            }));
  }
}
