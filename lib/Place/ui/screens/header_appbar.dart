import 'package:flutter/material.dart';
import 'package:app_viajes/Place/ui/widgets/card_image_list.dart';
import 'package:app_viajes/widgets-g/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack("Bienvenido", 250.0),
        CardImageList()
      ],
    );
  }

}