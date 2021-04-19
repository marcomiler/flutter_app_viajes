import 'package:app_viajes/User/model/user.dart';
import 'package:flutter/cupertino.dart';

class Place {

 String placeId;
 String name;
 String description;
 String urlImage;
 int likes;
  User userOwner;

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes,
    @required this.userOwner
  });
}