import 'package:flutter/material.dart';

class ZoomingWidget extends AnimatedWidget {
  final Widget child;

  const ZoomingWidget(
      {super.key, required Animation<double> animation, required this.child})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: animation.value,
          width: animation.value,
          child: child),
    );
  }
}
