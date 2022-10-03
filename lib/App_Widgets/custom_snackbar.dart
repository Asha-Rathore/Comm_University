import 'package:communiversity/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  CustomSnackBar(String msg) {
    Get.rawSnackbar(
      messageText: Text(
        msg,
        style: TextStyle(
          color: AppColors.PRIMARY_COLOR
        ),
      ),
      backgroundColor: AppColors.WHITE_COLOR,
      snackPosition: SnackPosition.TOP,
    );
  }
}
