import 'package:flutter/material.dart';
import 'package:app_viajes/widgets-g/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInScreen>{


  @override
  Widget build(BuildContext context) {
    return signGoogleUI();
  }

  String title = "Bienvenido \n esta es tu App de Viajes";

  Widget signGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              )
            ]
          )
        ]
      )
    );
  }

}
