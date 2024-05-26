import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/appWidget.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: Platform.isAndroid
          ? const FirebaseOptions(
              apiKey: 'AIzaSyC6jQCC6p-O8K7-Joq71mNE9SBxzhUEd90',
              appId: '1:746883475144:android:80e360bdc0334b799da7fd',
              messagingSenderId: '746883475144',
              projectId: 'fir-7e770')
          : const FirebaseOptions(
              apiKey: 'AIzaSyC6jQCC6p-O8K7-Joq71mNE9SBxzhUEd90',
              appId: '1:746883475144:android:80e360bdc0334b799da7fd',
              messagingSenderId: '746883475144',
              projectId: 'fir-7e770'));
  runApp(const FirebaseAPP());
}
