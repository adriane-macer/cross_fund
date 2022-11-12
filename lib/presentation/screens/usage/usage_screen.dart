import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: "Usage Screen".text,
        ));
  }
}
