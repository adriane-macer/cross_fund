import 'package:cross_fund/presentation/core/helpers/color_hex_helper.dart';
import 'package:flutter/material.dart';

abstract class CustomColors {
  static final Color white = ColorHexHelper('#ffffff');
  static final Color black = ColorHexHelper('#000000');
  static final Color primaryColor = ColorHexHelper('#ed1c24');

  static final Color primaryColorLight = ColorHexHelper('#07b2b7');
  static final Color primaryColorDark = ColorHexHelper('#0D47A1');

  static final Color textColorLight = ColorHexHelper('#ffffff');
  static final Color textColorDark = ColorHexHelper('#000000');

  static final Color backgroundColorLight = ColorHexHelper("#f5f5f5");

  // Not Yet Finalize
  static final Color darkPrimaryColor = ColorHexHelper("#1e223b");
  static final Color darkBackgroundColorLight = ColorHexHelper("#1e223b");
}

// Note: You may also used: 0xff + hexa
