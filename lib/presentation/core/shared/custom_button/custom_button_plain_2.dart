import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class CustomButtonPlain2 extends StatelessWidget {
  final VoidCallback? onClicked;
  final String title;
  final Color? color;

  const CustomButtonPlain2({
    Key? key,
    this.onClicked,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color ?? Theme.of(context).primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onClicked,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title.text.bold.color(Colors.white).alignCenter,
              const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              )
            ],
          ),
        ));
  }
}
