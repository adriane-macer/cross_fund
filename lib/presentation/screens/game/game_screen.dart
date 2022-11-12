import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Image.asset(
          "assets/images/games.png",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
