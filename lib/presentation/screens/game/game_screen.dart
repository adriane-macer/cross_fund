import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: "Game Screen".text,
        ));
  }
}
