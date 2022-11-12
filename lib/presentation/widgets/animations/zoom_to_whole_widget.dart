
import 'package:cross_fund/presentation/widgets/animations/zooming_widget.dart';
import 'package:flutter/material.dart';

class ZoomToWholeWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double size;

  const ZoomToWholeWidget(
      {Key? key,
      required this.duration,
      required this.size,
      required this.child})
      : super(key: key);

  @override
  State<ZoomToWholeWidget> createState() => _ZoomToWholeWidgetState();
}

class _ZoomToWholeWidgetState extends State<ZoomToWholeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ZoomingWidget(animation: animation, child: widget.child),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween<double>(begin: 0, end: widget.size).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
