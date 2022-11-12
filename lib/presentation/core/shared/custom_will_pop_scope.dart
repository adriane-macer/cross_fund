import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class CustomWillPopScope {
  static Future<DateTime?> updateBackPressTime(
      {required bool onWillPop}) async {
    if (!onWillPop) {
      return DateTime.now();
    }
    return null;
  }

  static Future<bool> onWillPop({required DateTime dateTime}) async {
    final DateTime currentTime = DateTime.now();
    DateTime backDateTime = dateTime;

    final bool backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        currentTime.difference(backDateTime) > const Duration(seconds: 2);

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backDateTime = currentTime;
      Fluttertoast.showToast(
          msg: "Double tap to exit application.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 14.0);
      return false;
    }

    return true;
  }
}
