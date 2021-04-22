import 'package:app_viajes/Place/model/place.dart';
import 'package:app_viajes/User/model/user.dart';
import 'package:app_viajes/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {

  final cfAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => cfAPI.updateUserData(user); 
  Future<void> updatePlaceData(Place place ) => cfAPI.updatePlaceData(place);

}