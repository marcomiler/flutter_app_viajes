import 'package:app_viajes/Place/ui/screens/home_trips.dart';
import 'package:app_viajes/User/bloc/bloc_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_viajes/Place/ui/screens/search_trips.dart';
import 'package:app_viajes/User/ui/screens/profile_trips.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
  }

}

class _PlatziTrips extends State<PlatziTrips> {
  int indexTap = 0;
  UserBloc _userBloc;

  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    BlocProvider<UserBloc>(
      child: ProfileTrips(),
      bloc: UserBloc(),
    )

  ];
  

  void onTapTapped(int index){

    setState(() {
      indexTap = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
            body: widgetsChildren[indexTap],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                primaryColor: Colors.purple
              ),
              child: BottomNavigationBar(
                onTap: onTapTapped,
                currentIndex: indexTap,
                  
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text("")
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        title: Text("")
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        title: Text(""),
                    ),
                  ]
              ),
            ),
    );
  }

}