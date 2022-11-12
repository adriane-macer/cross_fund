import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

import '../core/shared/custom_button/custom_button_plain_2.dart';

class CustomConfirmDialog extends StatelessWidget {
  final IconData iconData;
  final String? title;
  final String? description;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const CustomConfirmDialog({
    Key? key,
    required this.iconData,
    this.title,
    this.description,
    required this.onCancel,
    required this.onConfirm,
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
            SizedBox(
              height: Get.height * .20,
              child: Icon(
                iconData,
                size: Get.height * .10,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            '${title ?? 'Please confirm'} '.h6.alignCenter,
            '${description ?? 'Are you sure you want to proceed?'} '
                .text
                .alignCenter,
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
                  title: 'Proceed',
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
