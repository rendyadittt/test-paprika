import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_paprika/utilites/colors.dart';
import 'package:test_paprika/utilites/fonts.dart';

enum DataLoad { loading, done, failed }

class Helpers {
  static String currency(int value) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(value);
  }
  static setSnackbar(String message, {durations = 2}) {
    Get.snackbar(
      '',
      "",
      borderRadius: 8,
      titleText: const SizedBox(),
      margin: const EdgeInsets.all(16),
      messageText: Container(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          message,
          style: TStyle.medium14.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      padding: const EdgeInsets.only(top: 4, bottom: 6, left: 16, right: 16),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.black,
      backgroundColor: BaseColor.white,
      duration: Duration(seconds: durations),
    );
  }
}