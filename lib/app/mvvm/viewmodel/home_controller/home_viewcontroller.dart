import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecud/app/service/firebase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../models/user_model.dart';

class HomeViewController extends GetxController {
  RxBool isLoading = false.obs;
  List<UserModel> userList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  Future<void> getUsers() async {
    isLoading.value = true;
    try {
      userList = await DatabaseMethods().fetchUsers(userList);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  Future<void> deleteUser(String userID) async {
    await DatabaseMethods().deleteUserData(userID);
    await getUsers();
  }
  Future<void> updateUserData(String documentId,String userID,) async {

      UserModel userModel = UserModel(
          name: nameController.text,
          age: ageController.text,
          location: locationController.text,
        id: userID
      );

      try {
        await DatabaseMethods().updateUserData(documentId, userModel);
        debugPrint('Updated successfully');
        await getUsers();
      } catch (e) {
        print('Error updating user data:');
        print(e);
      }
    }}
