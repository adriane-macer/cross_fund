import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginHeaderWidget extends StatelessWidget {
  final double? avatarWidth;

  const LoginHeaderWidget({
    this.avatarWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: avatarWidth ?? Get.height * .40,
          child: Icon(
            Icons.account_circle,
            color: Theme.of(context).primaryColor,
            size: 100,
          ),
        ),
        SizedBox(
          height: Get.height * .05,
        ),
      ],
    );
  }
}
