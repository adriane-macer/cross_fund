
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

class CustomInfoDialog extends StatelessWidget {
  final IconData iconData;
  final String? title;
  final String? description;
  final VoidCallback onClose;

  const CustomInfoDialog({
    Key? key,
    required this.iconData,
    this.title,
    this.description,
    required this.onClose,
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
            '${title ?? 'Please confirm'} '.h6,
            if (description != null) '$description'.text.alignCenter,
            SizedBox(
              height: Get.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: onClose,
                  style: TextButton.styleFrom(),
                  child: 'Close'.text.bold.color(Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
