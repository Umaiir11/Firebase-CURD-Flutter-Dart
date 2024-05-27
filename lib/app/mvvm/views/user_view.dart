import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/customSnackBar.dart';
import '../viewmodel/user_controller/user_viewcontroller.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final userContorller = Get.put(UserViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text('User Data'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
                child: Text(
                  'Fill The Form ',
                  style: TextStyle(fontSize: 20),
                )),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: userContorller.nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: userContorller.ageController,
                decoration: InputDecoration(
                  hintText: 'Enter Age',
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Age',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: userContorller.locationController,
                decoration: InputDecoration(
                  hintText: 'Enter Location',
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Location',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if (userContorller.nameController.text == '' ||
                          userContorller.ageController.text == '' ||
                          userContorller.locationController.text == '')

                      {
                        CustomSnackbar.show(
                          iconData: Icons.warning_amber,
                          title: "Alert",
                          message: "",
                          backgroundColor: Colors.white,
                          iconColor: Colors.redAccent,
                          messageText: " Please fill the fields",
                          messageTextColor: Colors.black,
                        );
                      }

                      else{
                        Get.dialog(
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                          barrierDismissible: false,
                        );

                        bool isAdded = await userContorller.addUserData();
                        Get.back();
                        if (isAdded) {
                          CustomSnackbar.show(
                            iconData: Icons.check_circle,
                            title: "Alert",
                            message: "",
                            backgroundColor: Colors.white,
                            iconColor: Colors.green,
                            messageText: "Record Added",
                            messageTextColor: Colors.black,
                          );
                        } else {
                          CustomSnackbar.show(
                            iconData: Icons.warning_amber,
                            title: "Alert",
                            message: "",
                            backgroundColor: Colors.white,
                            iconColor: Colors.redAccent,
                            messageText: " Failed",
                            messageTextColor: Colors.black,
                          );
                        }
                      }

                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent)),
              ),
            )
          ],
        )
      ),
    );
  }
}
