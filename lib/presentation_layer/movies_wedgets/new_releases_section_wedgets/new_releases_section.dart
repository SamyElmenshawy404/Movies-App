import 'package:flutter/material.dart';

import 'new_releases_list.dart';

class NewReleasesListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff707070),
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(padding: EdgeInsets.all(10), child: Text('New Releases')),
          Expanded(child: NewReleaseList()),
        ],
      ),
    );
  }
}
