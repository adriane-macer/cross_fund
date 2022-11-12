import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

import '../core/shared/custom_button/custom_button_plain_2.dart';

class CustomWidgetConfirmDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final Widget child;
  final String? proceed;

  const CustomWidgetConfirmDialog({
    Key? key,
    required this.onCancel,
    required this.onConfirm,
    required this.child,
    this.proceed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            SizedBox(
              height: Get.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: onCancel,
                  style: TextButton.styleFrom(),
                  child: 'Close'.text.bold.color(Colors.grey),
                ),
                CustomButtonPlain2(
                  title: proceed ?? 'Proceed',
                  onClicked: onConfirm,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
