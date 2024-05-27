import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecud/app/service/firebase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

import '../../models/user_model.dart';

class UserViewController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  Future<void> addData() async {
    String? id = randomAlphaNumeric(10);
    UserModel userModel = UserModel(
        name: nameController.text, age: ageController.text, location: locationController.text, id: id);
    await DatabaseMethods().addUserDataa(
      userModel,
    );
    debugPrint('added sucessfully');
  }
}
