import 'package:flutter/material.dart';

class CustomButtonPrimaryGradient extends StatelessWidget {
  final VoidCallback? onClicked;
  final Widget title;
  final double elevetion;
  final Color colorFirst;
  final Color colorSecond;

  final Alignment alignmentBegin;
  final Alignment alignmentEnd;

  const CustomButtonPrimaryGradient({
    Key? key,
    required this.onClicked,
    required this.title,
    this.elevetion = 8,
    this.colorFirst = Colors.blue,
    this.colorSecond = Colors.blue,
    this.alignmentBegin = Alignment.topCenter,
    this.alignmentEnd = Alignment.bottomCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        elevation: elevetion,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        padding: const EdgeInsets.all(0),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: alignmentBegin,
            end: alignmentEnd,
            stops: const [.2, 1],
            colors: [colorFirst, colorSecond],
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: title,
      ),
    );
  }
}
