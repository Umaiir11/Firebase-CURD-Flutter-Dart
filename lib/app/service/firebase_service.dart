 import 'package:cloud_firestore/cloud_firestore.dart';

import '../mvvm/models/user_model.dart';

class DatabaseMethods{


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addUserDataa(UserModel user) async {
    CollectionReference users = _firestore.collection('User');
    await users.add(user.toJson());
  }

  Future<List<UserModel>> fetchUsers( List<UserModel> userList ) async {

    try {
      QuerySnapshot snap = await _firestore.collection('User').get();
      var database = snap.docs;

      userList = [];
      for (var value in database) {
        userList.add(UserModel.fromFirestore(value));
      }
      userList.forEach((element) {
        print(element.name);
      });
    } catch (e) {
      print(e);
    }
    return userList;
  }



}


