import 'package:cross_fund/application/constants/dialog_handler_state.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_confirm_dialog_handler_controller.dart';
import 'package:cross_fund/presentation/widgets/custom_confirm_dialog.dart';
import 'package:cross_fund/presentation/widgets/custom_info_dialog.dart';
import 'package:cross_fund/presentation/widgets/custom_loading_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ConfirmHandlerDialog extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String description;
  final Function onConfirm;
  final Function onCancel;
  final Function onClose;

  /// Generic dialog to handle the initial, loading, success and error
  ///
  /// Initialize first the controller to be used.
  ///
  ///      Get.create<IDialogHandlerController>(() =>
  ///            BiometricCreateHandlerController(),
  ///                       permanent: false);
  const ConfirmHandlerDialog({
    Key? key,
    required this.iconData,
    required this.title,
    required this.description,
    required this.onConfirm,
    required this.onCancel,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IConfirmDialogHandlerController>(builder: (_) {
      switch (_.dialogHandlerState.value) {
        case DialogHandlerState.Initial:
          return _buildContent(context, _);
        case DialogHandlerState.Loading:
          return _buildLoading(context, _);
        case DialogHandlerState.Success:
          return _buildSuccess(context, _);
        case DialogHandlerState.Error:
          return _buildError(context, _);
      }
    });
  }

  Widget _buildContent(
      BuildContext context, IConfirmDialogHandlerController controller) {
    return CustomConfirmDialog(
      iconData: iconData,
      onConfirm: controller.confirm,
      onCancel: () {
        Get.back();
      },
      title: title,
      description: description,
    );
  }

  Widget _buildSuccess(
      BuildContext context, IConfirmDialogHandlerController controller) {
    return CustomInfoDialog(
      iconData: Icons.check_circle_outline,
      title: controller.successTitle,
      description: controller.successMessage,
      onClose: () => Get.back(result: true),
    );
  }

  Widget _buildError(
      BuildContext context, IConfirmDialogHandlerController controller) {
    return CustomInfoDialog(
        iconData: Icons.warning,
        onClose: Get.back,
        title: controller.errorTitle,
        description: _errorDescription(controller.errorMessage));
  }

  Widget _buildLoading(
      BuildContext context, IConfirmDialogHandlerController controller) {
    return CustomLoadingDialog(
      title: controller.loadingMessage,
    );
  }

  String _errorDescription(String message) {
    if (message.isEmpty || message.toLowerCase().contains("null")) {
      return "Oops. Something went wrong";
    }
    return message;
  }
}
