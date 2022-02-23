import 'package:condoconta_accounting/core/constrants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastWidget {
  ToastWidget({
    this.backgroundColor,
    this.textColor,
    this.durationSeconds,
  });

  final Color? backgroundColor, textColor;
  final int? durationSeconds;

  show(String title, String message) => Get.snackbar(
        title,
        message,
        duration: Duration(seconds: durationSeconds ?? 3),
        backgroundColor: backgroundColor ?? accentColor,
        isDismissible: true,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        colorText: textColor,
      );
}
