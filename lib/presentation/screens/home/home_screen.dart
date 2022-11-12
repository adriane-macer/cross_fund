import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: "Home Screen".text,
        ));
  }
}
