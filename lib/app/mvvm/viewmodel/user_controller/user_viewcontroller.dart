import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecud/app/mvvm/viewmodel/home_controller/home_viewcontroller.dart';
import 'package:firebasecud/app/service/firebase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

import '../../models/user_model.dart';

class UserViewController extends GetxController {
  final homeController = Get.put(HomeViewController());

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  RxBool isloading = false.obs;
  Future<bool> addUserData() async {
    try {
      isloading.value =true;

      String id = randomAlphaNumeric(10);
      UserModel userModel = UserModel(
        name: nameController.text,
        age: ageController.text,
        location: locationController.text,
        id: id,
      );
      await DatabaseMethods().addUserDataa(userModel);
      debugPrint('Added successfully');
      await homeController.getUsers();
      isloading.value =false;

      clear();
      return true;
    } catch (e) {
      print('Error adding new user data:');
      print(e);
      clear();
      isloading.value =false;

      return false;
    }
  }


  clear(){
    nameController.clear();
    ageController.clear();
    locationController.clear();

  }
}
