import 'package:flutter/material.dart';

class OpacityToFullWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const OpacityToFullWidget(
      {Key? key, required this.duration, required this.child})
      : super(key: key);

  @override
  State<OpacityToFullWidget> createState() => _OpacityToFullWidgetState();
}

class _OpacityToFullWidgetState extends State<OpacityToFullWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, _) {
          return AnimatedOpacity(
              opacity: animation.value,
              duration: widget.duration,
              child: widget.child);
        });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
