import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/TopRatedResponse.dart';

import '../../../model/SimilarResponse.dart';
import '../../../network/remote/api_manager.dart';

class SimilarSection extends StatelessWidget {
  TopRated? topRated;

  SimilarSection(this.topRated);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SimilarResponse>(
        future: ApiManager.getSimilarMovies(topRated),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Container(
                color: Color(0xff282A28),
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'More Like This',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Expanded(
                          child: Container(
                            height: 200,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: 95,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff494848),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 5.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(
                                            2.0,
                                            2.0,
                                          ), // shadow direction: bottom right
                                        )
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          Image.network(
                                            'https://image.tmdb.org/t/p/w500/${snapshot.data!.results![index].posterPath}',
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
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.amberAccent,
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              snapshot.data!.results![index]
                                                  .voteAverage!
                                                  .toStringAsFixed(1)
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            snapshot
                                                .data!.results![index].title!,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              snapshot.data!.results![index]
                                                      .releaseDate!
                                                      .substring(0, 4) ??
                                                  '',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              snapshot.data!.results![index]
                                                          .adult ==
                                                      true
                                                  ? 'PG-13'
                                                  : 'R',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Container(
                                width: 15,
                              ),
                              itemCount: snapshot.data!.results!.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ]),
                ));
          }
          return CircularProgressIndicator();
        });
  }
}
