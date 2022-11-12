import 'package:flutter/material.dart';

class CustomButtonOutlined extends StatelessWidget {
  final VoidCallback? onClicked;
  final Widget title;
  final Color outlinedColor;
  final double? borderWidth;

  const CustomButtonOutlined(
      {Key? key,
      this.onClicked,
      required this.title,
      this.borderWidth,
      this.outlinedColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onClicked,
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        side: BorderSide(
          width: borderWidth ?? 2,
          color: outlinedColor,
        ),
      ),
      child: title,
    );
  }
}
