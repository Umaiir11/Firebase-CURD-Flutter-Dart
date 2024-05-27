import 'package:firebasecud/app/mvvm/models/user_model.dart';
import 'package:firebasecud/app/mvvm/views/user_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../widgets/custom_dialogBox.dart';
import '../viewmodel/home_controller/home_viewcontroller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  final homeContorller = Get.put(HomeViewController());

  void initState() {
    // TODO: implement initState
    super.initState();
    homeContorller.getUsers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Get.to(() => UserView());
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Obx(() {
          return homeContorller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: homeContorller.getUsers,
                  child: ListView.builder(
                    itemCount: homeContorller.userList.length,
                    itemBuilder: (context, index) {
                      UserModel user = homeContorller.userList[index];
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (BuildContext context) async {
                                String? userId = user.documentId;

                                await homeContorller.deleteUser(userId ?? "");

                                print("Delete button pressed on tile: $index");
                              },
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: (BuildContext context) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialogBox(
                                      nameController: homeContorller.nameController,
                                      ageController: homeContorller.ageController,
                                      locationController: homeContorller.locationController,
                                      onPressed: () async {
                                        String? documentId = user.documentId;
                                        String? userId = user.id;
                                        await homeContorller.updateUserData(documentId?? "" , userId ?? "");
                                        print("Update button pressed on tile: $index");
                                      },
                                    );
                                  },
                                );
                              },
                              backgroundColor: Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.share,
                              label: 'Edit',
                            ),
                          ],
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text('Name'), Text(user.name ?? "")],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text('Age'), Text(user.age ?? "")],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text('Location'), Text(user.location ?? "")],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        }),
      ),
    );
  }
}
