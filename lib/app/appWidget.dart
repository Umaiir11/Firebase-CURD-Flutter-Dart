import 'package:firebasecud/app/mvvm/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseAPP extends StatefulWidget {
  const FirebaseAPP({Key? key}) : super(key: key);

  @override
  State<FirebaseAPP> createState() => _FirebaseAPPState();
}

class _FirebaseAPPState extends State<FirebaseAPP> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: HomeView(),
    );
  }
}
