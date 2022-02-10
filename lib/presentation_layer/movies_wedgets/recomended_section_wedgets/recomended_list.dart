import 'package:flutter/material.dart';
import 'package:movies/api_manager.dart';
import 'package:movies/model/TopRatedResponse.dart';

import 'recomended_item.dart';

class RecommendedList extends StatelessWidget {
  List<TopRated>? items;

  @override
  build(BuildContext context) {
    return FutureBuilder<TopRatedResponse>(
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
          height: 130,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return RecomendedItem(items!.elementAt(index));
            },
            separatorBuilder: (context, index) =>
                Container(
                  width: 10,
                ),
            itemCount: items!.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
