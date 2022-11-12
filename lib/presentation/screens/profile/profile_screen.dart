import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/profile.png",
      fit: BoxFit.fitWidth,
    );
  }
}
