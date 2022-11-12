import 'package:flutter/material.dart';

abstract class ThemeHelper {
  static ThemeData setFontFamily(
      BuildContext context, ThemeData themeData, String fontFamily) {
    final textTheme = Theme.of(context).textTheme;

    return themeData.copyWith(
      textTheme: Theme.of(context).textTheme.copyWith(
            displayLarge:
                textTheme.displayLarge?.copyWith(fontFamily: fontFamily),
            displayMedium:
                textTheme.displayMedium?.copyWith(fontFamily: fontFamily),
            displaySmall:
                textTheme.displaySmall?.copyWith(fontFamily: fontFamily),
            headlineLarge:
                textTheme.headlineLarge?.copyWith(fontFamily: fontFamily),
            headlineMedium:
                textTheme.headlineMedium?.copyWith(fontFamily: fontFamily),
            headlineSmall:
                textTheme.headlineSmall?.copyWith(fontFamily: fontFamily),
            titleLarge: textTheme.titleLarge?.copyWith(fontFamily: fontFamily),
            titleMedium:
                textTheme.titleMedium?.copyWith(fontFamily: fontFamily),
            titleSmall: textTheme.titleSmall?.copyWith(fontFamily: fontFamily),
            bodyLarge: textTheme.bodyLarge?.copyWith(fontFamily: fontFamily),
            bodyMedium: textTheme.bodyMedium?.copyWith(fontFamily: fontFamily),
            bodySmall: textTheme.bodySmall?.copyWith(fontFamily: fontFamily),
            labelLarge: textTheme.labelLarge?.copyWith(fontFamily: fontFamily),
            labelMedium:
                textTheme.labelMedium?.copyWith(fontFamily: fontFamily),
            labelSmall: textTheme.labelSmall?.copyWith(fontFamily: fontFamily),
          ),
    );
  }
}
