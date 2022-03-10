import 'package:flutter/material.dart';
import 'package:movies/model/pupular_response.dart';

class WatchListScreen extends StatelessWidget {
  late List<Popular> favouriteItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Text(
              'Watchlist',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
