import 'package:app_viajes/User/model/user.dart' as U;
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreAPI{

  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore db = FirebaseFirestore.instance;

  void updateUserData(U.User user) async{
    DocumentReference ref = db.collection(USERS).doc(user.userId);
    return ref.set({
      'userId': user.userId,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now(),
    }, SetOptions( merge: true ));
  }
}