import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart'; 

class Snackbarmessage {
  // Singleton pattern untuk mempermudah pemanggilan service ini
  static Snackbarmessage instance = Snackbarmessage();

  // Fungsi untuk menampilkan snackbar success
  void showSuccessSnackbar({
    required String title, 
    required String message,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        margin: EdgeInsets.all(16),
        title: title,
        message: message,
        backgroundColor: colorGreen,
        icon: Icon(Icons.check_circle, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        borderRadius: 15.0,
      ),
    );
  }

  // Fungsi untuk menampilkan snackbar error
  void showErrorSnackbar({
    required String title,
    required String message,
  }) {
    Get.showSnackbar(GetSnackBar(
      margin: EdgeInsets.all(16),
      title: title,
      message: message,
      backgroundColor: colorRed,
      icon: Icon(Icons.cancel, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      borderRadius: 15.0,
    ));
  }

  // Fungsi untuk menampilkan snackbar info
  void showInfoSnackbar({
    required String title,
    required String message,
  }) {
    Get.showSnackbar(GetSnackBar(
      margin: EdgeInsets.all(16),
      title: title,
      message: message,
      backgroundColor: colorPrimary,
      icon: Icon(Icons.info, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      borderRadius: 15.0,
    ));
  }
}
