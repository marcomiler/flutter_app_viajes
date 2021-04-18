import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_viajes/User/repository/firebase_auth_api.dart';

class AuthRepository {

  final _firebaseAuthAPi = FirebaseAuthAPI();

  Future<User> signInFirebase() => _firebaseAuthAPi.signIn();

}