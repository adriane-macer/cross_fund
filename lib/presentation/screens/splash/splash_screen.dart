import 'package:cross_fund/application/controllers/splash/splash_controller.dart';
import 'package:cross_fund/presentation/core/shared/custom_colors.dart';
import 'package:cross_fund/presentation/widgets/animations/zooming_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((state) => const Text('Loaded'),
          onLoading: const CustomSplashWidget()),
    );
  }
}

class CustomSplashWidget extends StatelessWidget {
  const CustomSplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backGroundWidget(),
        imageWidget(),
      ],
    );
  }

  Widget imageWidget() {
    return Center(child: _LogoWidget());
  }

  Widget backGroundWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
    );
  }
}

class _LogoWidget extends StatefulWidget {
  const _LogoWidget({Key? key}) : super(key: key);

  @override
  State<_LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<_LogoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ZoomingWidget(
        animation: animation,
        child: Image.asset("assets/images/crossborder.png"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 160, end: 280).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
