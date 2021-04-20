import 'package:app_viajes/User/bloc/bloc_user.dart';
import 'package:app_viajes/User/model/user.dart' as u;
import 'package:app_viajes/platzi_trips.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_viajes/widgets-g/gradient_back.dart';
import 'package:app_viajes/widgets-g/button_green.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{

  UserBloc _userBloc;
  double screenWidth;

  String title = "Bienvenido \n esta es tu App de Viajes";

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    //instanciamos UserBloc
    _userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: _userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        //snapshot contiene nuestra data - Objeto User
        if(!snapshot.hasData || snapshot.hasError){
          return signGoogleUI();
        }else{
          return PlatziTrips();
        }
      },
    );
  }

  Widget signGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(height: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: screenWidth,
                    child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
              ButtonGreen(
                 text: "Login with Gmail",
                 onPressed: (){
                   _userBloc.signIn()
                   .then((User user) {
                     _userBloc.updateUserData(u.User(
                       userId: user.uid,
                       name: user.displayName,
                       email: user.email,
                       photoURL: user.photoURL,
                     ));
                   });
                 },
                 height: 50.0,
                 width: 300.0,
              )
            ]
          )
        ]
      )
    );
  }

}
