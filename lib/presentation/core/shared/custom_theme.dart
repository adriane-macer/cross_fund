import 'package:cross_fund/presentation/core/shared/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class CustomTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: CustomColors.primaryColor,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 237, 38, 36),
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actionsIconTheme: IconThemeData(color: CustomColors.primaryColor)),
    scaffoldBackgroundColor: Colors.white,
  );
}
