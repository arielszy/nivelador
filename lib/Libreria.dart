import 'package:flutter/material.dart';

class NOPeliculaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          //    aaa('https://ichef.bbci.co.uk/news/800/cpsprodpb/F403/production/_109476426_jheison3.png'),
        ],
      ),
    );
  }
}

aaa(String url) {
  return Image.network(
    url,
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
