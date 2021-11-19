import 'package:flutter/material.dart';
import 'package:login/Place/model/place.dart';
import 'profile_place.dart';

class ProfilePlacesList extends StatelessWidget {
  Place place = new Place(
      'Ruta del sillar',
      'Toma 40 minutos llegar desde Arequipa',
      'Lugar muy bonito',
      '123,123,123');
  Place place2 = new Place('Cañon del colca', 'Famoso para el senderismo',
      'Lugar muy bonito', '321,321,321');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace('img/lugar01.jpg', place),
          ProfilePlace('img/lugar02.jpg', place2),
        ],
      ),
    );
  }
}
