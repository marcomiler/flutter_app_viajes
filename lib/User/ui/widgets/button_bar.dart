import 'package:app_viajes/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:app_viajes/User/ui/widgets/circle_button.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ButtonsBar extends StatelessWidget {

  UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            //Cambiar contraseña
            CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6), 
            () => {}),
            //Añadir un nuevo lugar
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), 
            () => {}),
            //Cerrar Sesión
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
            () => {
              _userBloc.signOut()
            }),
          ],
        )
    );
  }

}