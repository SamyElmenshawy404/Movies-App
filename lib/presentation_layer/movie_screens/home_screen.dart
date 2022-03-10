import 'package:flutter/material.dart';
import 'package:movies/model/TopRatedResponse.dart';
import 'package:movies/presentation_layer/movies_wedgets/new_releases_section_wedgets/new_releases_section.dart';
import 'package:movies/presentation_layer/movies_wedgets/recomended_section_wedgets/recomended_section.dart';

import '../../network/remote/api_manager.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xff121312),
//       child: Column(
//         children: [
//           Expanded(
//             child: Container(
//               color: Color(0xff121312),
//               height: MediaQuery.of(context).size.height * .35,
//               child: Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: MediaQuery.of(context).size.height * .25,
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     child: Container(
//                       margin: EdgeInsets.only(left: 30),
//                       height: 170,
//                       width: 115,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 30,
//                     right: 100,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'name of the movie',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           'name of the movie',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 13,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//             height: 100,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [Expanded(child: NewReleasesList())],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Container(
//             color: Color(0xff707070),
//             height: 160,
//           ),
//         ],
//       ),
//     );
//   }
// }
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TopRated>? items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FutureBuilder<TopRatedResponse>(
          future: ApiManager.fetchTopRated(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              items = snapshot.data!.results;
            }

            if (snapshot.hasError) {
              //Todo:in case Error retry
              return Center(child: Text('${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            }
            return Container(
              color: Color(0xff121312),
              height: MediaQuery.of(context).size.height * .35,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .25,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${items![0].backdropPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 170,
                      width: 115,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${items![0].posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items![0].title.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          items![0].releaseDate.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),

        SizedBox(
          height: 10,
        ),
        Expanded(child: NewReleasesListSection()),
        SizedBox(
          height: 5,
        ),
        Expanded(child: RecommendedListSection()),

        // NewReleasesList()

        // SizedBox(
        //     width: MediaQuery.of(context).size.width,
        //     height: 160,
        //     // color: Colors.yellow,
        //     child: NewReleasesList()),
        // Container(
        //   color: Color(0xff707070),
        //   height: 160,
        // ),
      ],
    );
  }
}
