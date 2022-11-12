import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class CustomButtonPlain extends StatelessWidget {
  final VoidCallback? onClicked;
  final String title;
  final Color? titleColor;
  final double titleSize;
  final Color? color;
  final bool allCaps;
  final double borderRadius;
  final bool isTitleBold;
  final bool isItalic;

  const CustomButtonPlain({
    Key? key,
    this.onClicked,
    required this.title,
    this.titleColor,
    this.titleSize = 20.0,
    this.color,
    this.allCaps = true,
    this.borderRadius = 20,
    this.isTitleBold = true,
    this.isItalic = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color ?? Theme.of(context).primaryColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        onPressed: onClicked,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: _title()),
        ));
  }

  Widget _title() {
    final titleText = allCaps ? title.toUpperCase() : title;
    if (isTitleBold) {
      if (isItalic) {
        return titleText.text
            .size(titleSize)
            .bold
            .color(titleColor ?? Colors.white)
            .alignCenter
            .italic;
      } else {
        return titleText.text
            .size(titleSize)
            .bold
            .color(titleColor ?? Colors.white)
            .alignCenter;
      }
    } else {
      if (isItalic) {
        return titleText.text
            .size(titleSize)
            .color(titleColor ?? Colors.white)
            .alignCenter
            .italic;
      } else {
        return titleText.text
            .size(titleSize)
            .color(titleColor ?? Colors.white)
            .alignCenter;
      }
    }
  }
}
