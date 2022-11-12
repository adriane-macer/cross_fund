import 'package:cross_fund/application/controllers/login/login_controller.dart';
import 'package:cross_fund/presentation/screens/login/widgets/login_form_builder_widget.dart';
import 'package:cross_fund/presentation/screens/login/widgets/login_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => LoginController.to.checkWillPopScope(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * .05, vertical: Get.height * .05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginHeaderWidget(avatarWidth: Get.width * .40),
              const LoginFormBuilderWidget()
            ],
          ),
        ),
      ),
    );
  }
}
