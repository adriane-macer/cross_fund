import 'package:cross_fund/application/constants/dialog_handler_state.dart';
import 'package:cross_fund/application/controllers/buy/remittance_handler_controller.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_confirm_dialog_handler_controller.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_remittance_handler_controller.dart';
import 'package:cross_fund/presentation/core/widgets/dialogs/custom_action_dialog.dart';
import 'package:cross_fund/presentation/core/widgets/dialogs/custom_remittance_dialog.dart';
import 'package:cross_fund/presentation/widgets/custom_confirm_dialog.dart';
import 'package:cross_fund/presentation/widgets/custom_info_dialog.dart';
import 'package:cross_fund/presentation/widgets/custom_loading_dialog.dart';
import 'package:cross_fund/presentation/widgets/custom_widget_confirm_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RemittanceHandlerDialog extends StatelessWidget {
  final IconData iconData;
  final Function(String, String, String) onConfirm;
  final Function onCancel;
  final String? proceed;
  final String currency;

  /// Generic dialog to handle the initial, loading, success and error
  ///
  /// Initialize first the controller to be used.
  ///
  ///      Get.create<IRemittanceHandlerController>(() =>
  ///            RemittanceHandlerController(),
  ///                       permanent: false);
  const RemittanceHandlerDialog({
    Key? key,
    required this.iconData,
    required this.onConfirm,
    required this.onCancel,
    this.proceed,
    required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IRemittanceHandlerController>(builder: (_) {
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
      BuildContext context, IRemittanceHandlerController controller) {
    return CustomRemittanceDialog(
      iconData: iconData,
      onConfirm: (origin, target, amount) async {
        await controller.confirm(
            currency: currency, origin: origin, target: target, amount: amount);
      },
      onCancel: Get.back,
      currency: currency,
    );
  }

  Widget _buildSuccess(
      BuildContext context, IRemittanceHandlerController controller) {
    return CustomInfoDialog(
      iconData: Icons.check_circle_outline,
      title: controller.successTitle,
      description: controller.successMessage,
      onClose: () => Get.back(result: true),
    );
  }

  Widget _buildError(
      BuildContext context, IRemittanceHandlerController controller) {
    return CustomInfoDialog(
        iconData: Icons.warning,
        onClose: Get.back,
        title: controller.errorTitle,
        description: _errorDescription(controller.errorMessage));
  }

  Widget _buildLoading(
      BuildContext context, IRemittanceHandlerController controller) {
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
