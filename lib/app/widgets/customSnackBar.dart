
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomSnackbar {
  static void show({
    required String? title,
    required String? message,
    required Color? backgroundColor,
    required IconData? iconData, // New parameter for icon data
    required Color? iconColor,
    required String? messageText,
    required Color? messageTextColor,
  }) {
    Get.snackbar(
      title ?? '',
      "",
      backgroundColor: backgroundColor,
      icon: iconData != null ? Icon(iconData, color: iconColor) : null, // Set icon based on iconData parameter
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(16),
      borderRadius: 10,
      borderWidth: 1,
      borderColor: Colors.white,
      messageText: Text(
        messageText ?? '',
        style: TextStyle(color: messageTextColor),
      ),
    );
  }
}
