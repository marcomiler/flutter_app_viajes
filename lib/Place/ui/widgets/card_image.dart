import 'package:flutter/material.dart';
import 'package:app_viajes/widgets-g/floating_action_button_green.dart';

class  CardImageWithFavIcon extends StatelessWidget {

  final String pathImage; 
  final double width;
  final double height;
  double left = 20.0;
  final VoidCallback onPressedFavIcon;
  final IconData iconData;

  CardImageWithFavIcon({
    Key key,
    @required this.pathImage,
    @required this.width,
    @required this.height,
    @required this.onPressedFavIcon,
    @required this.iconData,
    this.left,
  });

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        top: 80.0,
        left: left

      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: AssetImage(pathImage)
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]

      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(iconData: iconData, onPressed: onPressedFavIcon)
      ],
    );
  }

}