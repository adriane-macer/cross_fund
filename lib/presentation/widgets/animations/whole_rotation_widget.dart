import 'dart:math';
import 'package:cross_fund/presentation/widgets/animations/rotating_widget.dart';
import 'package:flutter/material.dart';

class WholeRotationWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const WholeRotationWidget(
      {Key? key, required this.duration, required this.child})
      : super(key: key);

  @override
  State<WholeRotationWidget> createState() => _WholeRotationWidgetState();
}

class _WholeRotationWidgetState extends State<WholeRotationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return RotatingWidget(animation: animation, child: widget.child);
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
