import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("img/persona01.jpeg", "Sergio Rondon", "1 review · 5 photos",
            "Es un lugar muy bonito"),
        Review("img/persona02.jpg", "Jhon Mamani", "2 review · 5 photos",
            "Es un lugar muy bonito"),
        Review("img/persona03.jpg", "Joel Atamari", "2 review · 2 photos",
            "Es un lugar muy bonito"),
      ],
    );
  }
}
