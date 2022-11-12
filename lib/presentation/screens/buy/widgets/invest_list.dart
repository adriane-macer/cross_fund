import 'package:cross_fund/application/controllers/buy/invest_handler_controller.dart';
import 'package:cross_fund/application/controllers/widget_controller/i_confirm_dialog_handler_controller.dart';
import 'package:cross_fund/presentation/core/widgets/dialogs/confirm_handler_custom_dialog.dart';
import 'package:cross_fund/presentation/core/widgets/dialogs/confirm_handler_dialog.dart';
import 'package:cross_fund/services/data/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

class InvestList extends StatelessWidget {
  const InvestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = ProductService.to.list;
    return Column(
      children: [
        ...products.map((e) => Card(
              child: ListTile(
                onTap: () async {
                  Get.create<IConfirmDialogHandlerController>(
                      () => InvestHandlerController(),
                      permanent: false);
                  final result = await Get.dialog(ConfirmHandlerCustomDialog(
                    onConfirm: () {},
                    onCancel: Get.back,
                    onClose: Get.back,
                    proceed: "Buy",
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.network(
                            e.image,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          e.name.h4,
                          SizedBox(
                            height: 12,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Features:".h6,
                                ...e.attributes.map((attribute) =>
                                    "${attribute.traitType}: ${attribute.value}"
                                        .text)
                              ]),
                        ],
                      ),
                    ),
                  )
                      // ConfirmHandlerDialog(
                      //     iconData: Icons.payments_rounded,
                      //     title: "Invest to ${e.name}",
                      //     description: "You are about to invest ${e.name}.",
                      //     onConfirm: () {},
                      //     onCancel: () => Get.back(result: false),
                      //     onClose: () => Get.back(result: true)),
                      );
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    e.name.text,
                    "₱ ${e.attributes.last.value}".text.bold
                  ],
                ),
                leading: Image.network(e.image),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    e.description.text,
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
