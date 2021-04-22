import 'package:app_viajes/Place/model/place.dart';
import 'package:app_viajes/User/repository/cloud_firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:app_viajes/User/repository/auth_repository.dart';
import 'package:app_viajes/User/model/user.dart' as u;

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos (Streams)
  //Stream - Firebase 
  ////StreamController
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  //Casos de uso
  //1. SignIn a la aplicacion con Google
  Future<User> signIn() => _auth_repository.signInFirebase();

  //2. Registrar usuario en BD
  final cfRepo = CloudFirestoreRepository();
  void updateUserData(u.User user) => cfRepo.updateUserDataFirestore(user);

  Future<void> updatePlaceData(Place place) => cfRepo.updatePlaceData(place);
  
  // SignOut
  signOut() {
    _auth_repository.signOut();
  }

  //
 
  @override
  void dispose() {
   
  }

}