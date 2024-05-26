import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecud/app/service/firebase_service.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../models/user_model.dart';

class HomeViewController extends GetxController {

  RxBool isLoading = false.obs;
  List<UserModel> userList = [];
  Future<void> getUsers() async {
    isLoading.value = true;
    try {
      userList  = await DatabaseMethods().fetchUsers(userList);
      isLoading.value = false;

    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }
}
