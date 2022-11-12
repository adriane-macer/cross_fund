import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class CustomResendButtonWidget extends StatelessWidget {
  final String title;
  final bool isLoading;

  const CustomResendButtonWidget({
    Key? key,
    required this.title,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title.cap.bold.color(Theme.of(context).primaryColor),
        if (isLoading)
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
          )
        else
          const SizedBox.shrink()
      ],
    );
    ;
  }
}
