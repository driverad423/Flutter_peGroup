import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("img/lugar01.jpg"),
          CardImage("img/lugar02.jpg"),
          CardImage("img/lugar03.jpg"),
          CardImage("img/lugar04.jpg"),
          CardImage("img/lugar05.jpg"),
          CardImage("img/lugar06.jpg"),
        ],
      ),
    );
  }
}
