import 'package:app_viajes/Place/model/place.dart';
import 'package:app_viajes/User/model/user.dart' as U;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class CloudFirestoreAPI{

  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  void updateUserData(U.User user) async{
    DocumentReference ref = db.collection(USERS).doc(user.userId);
    return await ref.set({
      'userId': user.userId,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now(),
    }, SetOptions( merge: true ));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = db.collection(PLACES);//asi firestore nos crea un ID por defecto
    auth.User user = _auth.currentUser;
    DocumentReference userRef = db.collection(this.USERS).doc(user.uid);

    await refPlaces.add({
      "name": place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': userRef//"${USERS}/${user.uid}"
    });
  }
}