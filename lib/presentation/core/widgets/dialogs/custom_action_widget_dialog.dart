import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

class CustomActionWidgetDialog extends StatelessWidget {
  const CustomActionWidgetDialog(
      {Key? key,
      required this.title,
      required this.actionName,
      required this.actionCallback,
      required this.child})
      : super(key: key);
  final String title;
  final String actionName;
  final Function() actionCallback;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final blackTextStyle = TextStyle(
        fontFamily: 'Nunito', fontWeight: FontWeight.w900, color: primaryColor);
    final extraLightTextStyle = TextStyle(
        fontFamily: 'Nunito', fontWeight: FontWeight.w200, color: primaryColor);
    final borderColor = Color(0xFFE5E5E5);

    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
                width: double.infinity,
              ),
              title.text.bold
                  .color(primaryColor)
                  .styled(style: blackTextStyle)
                  .alignCenter
                  .paddingSymmetric(horizontal: 32),
              const SizedBox(
                height: 8,
              ),
              child,
              const SizedBox(
                height: 16,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: borderColor),
                    right: BorderSide(color: borderColor),
                  )),
                  child: TextButton(
                      onPressed: Get.back,
                      child: "Cancel".text
                          .size(12)
                          .color(primaryColor)
                          .styled(style: blackTextStyle)),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: borderColor),
                  )),
                  child: TextButton(
                      onPressed: actionCallback,
                      child: actionName.text
                          .size(12)
                          .color(primaryColor)
                          .styled(style: blackTextStyle)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
