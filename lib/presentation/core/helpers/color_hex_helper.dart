import 'package:flutter/material.dart';

/// Usage:
/// Color color2 = HexColor("#b74093");
class ColorHexHelper extends Color {
  static int _getColorFromHex(String hexColor) {
    final temp = hexColor.replaceAll("#", "0xff");
    return int.parse(temp);
  }

  ColorHexHelper(final String hexColor) : super(_getColorFromHex(hexColor));
}
