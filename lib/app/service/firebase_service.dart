import 'package:cloud_firestore/cloud_firestore.dart';

import '../mvvm/models/user_model.dart';

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Create (add-user)
  Future<void> addUserDataa(UserModel user) async {
    CollectionReference collectionReference = _firestore.collection('User');
    await collectionReference.add(user.toJson());
  }

  //Read (fetch-users)
  Future<List<UserModel>> fetchUsers(List<UserModel> userList) async {
    try {
      CollectionReference collectionReference = _firestore.collection('User');
      QuerySnapshot snap = await collectionReference.get();
      List<DocumentSnapshot> documents = snap.docs;

      userList.clear();
      for (DocumentSnapshot data in documents) {
        // we get the document id for update the document instead of using where clause
        String documentId = data.id;
        UserModel userModel = UserModel.fromFirestore(data, documentId);
        userList.add(userModel);
      }

    } catch (e) {
      print(e);
    }
    return userList;
  }

  //Update (update-user)
  Future<void> updateUserData(String documentId, UserModel updatedUserData) async {
    //we use the document id to update the user
    try {
      CollectionReference collectionReference = _firestore.collection('User');
      await collectionReference.doc(documentId).update(updatedUserData.toJson());
    } catch (e) {
      print('Error updating document with ID: $documentId');
      print(e);
    }
  }

  //Delete (delete-user)
  Future<void> deleteUserData(String documentId) async {
    try {
      CollectionReference collectionReference = _firestore.collection('User');
      await collectionReference.doc(documentId).delete();
    } catch (e) {
      print(e);
    }
  }
}