import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageUtil {
  static showMessageError(String message) {
    Get.snackbar(
      "ERROR",
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  static showMessageSuccess(String message) {
    Get.snackbar(
      "SUCCESS",
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
