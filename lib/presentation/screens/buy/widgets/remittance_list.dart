import 'package:cross_fund/application/controllers/buy/remittance_handler_controller.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_confirm_dialog_handler_controller.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_remittance_handler_controller.dart';
import 'package:cross_fund/infrastructure/core/provider/remittance/i_remittance_provider.dart';
import 'package:cross_fund/infrastructure/core/provider/remittance/remittance_api_provider.dart';
import 'package:cross_fund/infrastructure/core/repository/remittance/i_remittance_repository.dart';
import 'package:cross_fund/infrastructure/core/repository/remittance/remittance_repository.dart';
import 'package:cross_fund/presentation/core/widgets/dialogs/confirm_handler_dialog.dart';
import 'package:cross_fund/presentation/core/widgets/dialogs/remittance_handler_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

class RemittanceList extends StatelessWidget {
  const RemittanceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...[
            _Currency(
                icon: Icons.currency_yen,
                value: "0.01",
                name: "Yen",
                symbol: "¥"),
            _Currency(
                icon: Icons.euro, value: "0.01", name: "Euro", symbol: "€"),
            _Currency(
                icon: Icons.currency_rupee,
                value: "0.01",
                name: "Rupee",
                symbol: "₹"),
          ].map((e) => Card(
                child: ListTile(
                  onTap: () async {
                    Get.lazyPut<IRemittanceProvider>(
                        () => RemittanceApiProvider());
                    Get.lazyPut<IRemittanceRepository>(
                        () => RemittanceRepository(Get.find()));
                    Get.create<IRemittanceHandlerController>(
                        () => RemittanceHandlerController(Get.find()),
                        permanent: false);
                    await Get.dialog(RemittanceHandlerDialog(
                      iconData: e.icon,
                      currency: e.symbol,
                      onConfirm: (origin, target, amount) {},
                      onCancel: Get.back,
                    ));
                  },
                  title: e.name.text,
                  leading: Icon(e.icon),
                  // subtitle: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     e.value.text,
                  //   ],
                  // ),
                ),
              ))
        ],
      ),
    );
  }
}

class _Currency {
  final IconData icon;
  final String value;
  final String name;
  final String symbol;

  _Currency(
      {required this.icon,
      required this.value,
      required this.name,
      required this.symbol});
}
