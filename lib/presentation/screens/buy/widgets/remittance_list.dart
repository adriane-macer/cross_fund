import 'package:cross_fund/application/controllers/buy/remittance_handler_controller.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_confirm_dialog_handler_controller.dart';
import 'package:cross_fund/infrastructure/core/provider/remittance/i_remittance_provider.dart';
import 'package:cross_fund/infrastructure/core/provider/remittance/remittance_api_provider.dart';
import 'package:cross_fund/infrastructure/core/repository/remittance/i_remittance_repository.dart';
import 'package:cross_fund/infrastructure/core/repository/remittance/remittance_repository.dart';
import 'package:cross_fund/presentation/core/widgets/dialogs/confirm_handler_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

class RemittanceList extends StatelessWidget {
  const RemittanceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...[
          _Currency(icon: Icons.currency_yen, value: "0.01", name: "Yen"),
          _Currency(icon: Icons.euro, value: "0.01", name: "Euro"),
          _Currency(icon: Icons.currency_yuan, value: "0.01", name: "Yuan"),
          _Currency(icon: Icons.currency_pound, value: "0.01", name: "Pound")
        ].map((e) => Card(
              child: ListTile(
                onTap: () async {
                  Get.lazyPut<IRemittanceProvider>(
                      () => RemittanceApiProvider());
                  Get.lazyPut<IRemittanceRepository>(
                      () => RemittanceRepository(Get.find()));
                  Get.create<IConfirmDialogHandlerController>(
                      () => RemittanceHandlerController(e.value, Get.find()),
                      permanent: false);
                  await Get.dialog(
                    ConfirmHandlerDialog(
                        iconData: Icons.payments_rounded,
                        title: "Remittance",
                        description: "You are about to remit ${e.name}.",
                        onConfirm: () {},
                        onCancel: () => Get.back(result: false),
                        onClose: () => Get.back(result: true)),
                  );
                },
                title: e.name.text,
                leading: Icon(e.icon),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    e.value.text,
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

class _Currency {
  final IconData icon;
  final String value;
  final String name;

  _Currency({required this.icon, required this.value, required this.name});
}
