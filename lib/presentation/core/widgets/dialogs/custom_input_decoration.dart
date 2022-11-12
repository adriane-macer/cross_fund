import 'package:flutter/material.dart';
import 'package:get/get.dart';

InputDecoration customInputDecoration() {
  return InputDecoration(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide(color: Theme.of(Get.context!).primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(color: Theme.of(Get.context!).primaryColor)),
  );
}
