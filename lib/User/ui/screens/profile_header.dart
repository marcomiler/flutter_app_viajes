import 'package:app_viajes/User/bloc/bloc_user.dart';
import 'package:app_viajes/User/model/user.dart';
import 'package:app_viajes/User/ui/widgets/button_bar.dart';
import 'package:flutter/material.dart';
import 'package:app_viajes/User/ui/widgets/user_info.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileHeader extends StatelessWidget {

  UserBloc _userBloc;
  User _user;

  @override
  Widget build(BuildContext context) {

    _userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: _userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active: 
            return showProfileData(snapshot);
          case ConnectionState.done:
          return showProfileData(snapshot);
        }
      } 
    );
  }
/*
    final title = Text(
      'Profile',
      style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0
      ),
    );

    return Container(
      margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              title
            ],
          ),
          UserInfo('assets/img/ann.jpg', 'Anahí Salgado','anahi@platzi.com'),
          ButtonsBar()
        ],
      ),
    );*/


    Widget showProfileData(AsyncSnapshot snapshot){
      if(!snapshot.hasData || snapshot.hasError){
        print("No está logueado");
        return Container(
          margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0
          ),
          child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la información, Haz Login")
           ]
          )
         );
      }else{
        print("Logueado");
        //print(snapshot.data);
        _user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoURL: snapshot.data.photoURL);
          final title = Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),
        );

        return Container(
          margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  title
                ],
              ),
              UserInfo(_user),
              ButtonsBar()
            ],
          ),
        );
      }
    }

}