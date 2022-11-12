import 'package:cross_fund/presentation/core/shared/custom_will_pop_scope.dart';
import 'package:cross_fund/presentation/core/widgets/dialogs/custom_action_dialog.dart';
import 'package:cross_fund/presentation/navigation/routes.dart';
import 'package:cross_fund/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final authService = AuthService.to;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final Rx<bool> obscure = true.obs;
  final Rx<bool> isLoading = false.obs;
  final Rx<bool> validated = false.obs;

  DateTime backButtonPressTime = DateTime.now();

  void handleObscure() {
    obscure.toggle();
  }

  Future<void> handleLogin() async {
    validated(true);
    update();
    isLoading(true);

    try {
      if (formKey.currentState?.saveAndValidate() ?? false) {

        await Future.delayed(Duration(milliseconds: 1300));
        // TODO : Implement Code
        isLoading(false);

      }
    } catch (e) {
      debugPrint("LoginController.handleLogin: $e");
      isLoading(false);
      Get.dialog(
          CustomActionDialog(
              title: "Failed",
              description: "Something went wrong.",
              actionName: "Try Again",
              actionCallback: () => Get.back()),
          barrierDismissible: false);
    }

    isLoading(false);
  }

  Future<bool> checkWillPopScope() async {
    final value =
    await CustomWillPopScope.onWillPop(dateTime: backButtonPressTime);
    backButtonPressTime =
        await CustomWillPopScope.updateBackPressTime(onWillPop: value) ??
            backButtonPressTime;
    return value;
  }
}
