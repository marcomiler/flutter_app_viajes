import 'dart:io';
import 'package:app_viajes/Place/model/place.dart';
import 'package:app_viajes/Place/ui/widgets/card_image.dart';
import 'package:app_viajes/Place/ui/widgets/title_input_location.dart';
import 'package:app_viajes/User/bloc/bloc_user.dart';
import 'package:app_viajes/widgets-g/button_purple.dart';
import 'package:app_viajes/widgets-g/gradient_back.dart';
import 'package:app_viajes/widgets-g/text_input.dart';
import 'package:app_viajes/widgets-g/title_header.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddPlaceScreen extends StatefulWidget {

  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen>{

  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();

  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    // final _controllerTitlePlace = TextEditingController();
    // final _controllerDescriptionPlace = TextEditingController();
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300.0),
          Row( //AppBar
            children: <Widget>[
              Container(// boton back
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45),
                    onPressed: () => Navigator.pop(context)
                  ),
                )
              ),

              Flexible(
                child: Container(
                 padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                 child: TitleHeader(title: "Add a new Place"),
                )
              )
            ]
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFavIcon(
                    pathImage: "assets/img/mountain_stars.jpeg",
                    width: 350.0, 
                    height: 250.0,
                    onPressedFavIcon: (){},
                    iconData: Icons.camera_alt,
                    left: 0.0,
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  )
                ),
                TextInput(
                  hintText: "Dexcription",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top:20.0),
                  child: TextInputLocation(
                    hintText: "Add Location",
                   iconData: Icons.location_on,
                   )
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: () {
                      //Firebase Storage
                      //url
                      //Cloud Firestore
                      //Place - title, description, url, userOwner, likes
                      userBloc.updatePlaceData(Place(
                        name: _controllerTitlePlace.text,
                        description: _controllerDescriptionPlace.text,
                        likes: 0
                      )).whenComplete(() {
                        print("Termin??");
                        Navigator.pop(context);
                      });
                    }
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }

}

