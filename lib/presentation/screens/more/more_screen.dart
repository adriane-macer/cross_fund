import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: "More Screen".text,
        ));
  }
}
