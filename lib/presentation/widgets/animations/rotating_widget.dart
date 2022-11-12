import 'package:flutter/material.dart';

class RotatingWidget extends AnimatedWidget {
  final Widget child;

  const RotatingWidget(
      {super.key, required Animation<double> animation, required this.child})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.rotate(angle: animation.value, child: child);
  }
}
