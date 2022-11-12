import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

class CustomActionDialog extends StatelessWidget {
  const CustomActionDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.actionName,
      required this.actionCallback})
      : super(key: key);
  final String title;
  final String description;
  final String actionName;
  final Function() actionCallback;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final borderColor = Color(0xFFE5E5E5);
    final blackTextStyle = TextStyle(
        fontFamily: 'Nunito', fontWeight: FontWeight.w900, color: primaryColor);
    final extraLightTextStyle = TextStyle(
        fontFamily: 'Nunito', fontWeight: FontWeight.w200, color: primaryColor);

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
                  .size(16)
                  .color(primaryColor)
                  .styled(style: blackTextStyle)
                  .alignCenter
                  .paddingSymmetric(horizontal: 32),
              const SizedBox(
                height: 8,
              ),
              description.text
                  .size(16)
                  .color(primaryColor)
                  .styled(style: extraLightTextStyle)
                  .alignCenter
                  .paddingSymmetric(horizontal: 32),
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
                  height: 56,
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: borderColor),
                    right: BorderSide(color: borderColor),
                  )),
                  child: TextButton(
                      onPressed: Get.back,
                      child: "Cancel"
                          .text
                          .size(12)
                          .color(primaryColor)
                          .styled(style: blackTextStyle)),
                ),
              ),
              Expanded(
                child: Container(
                  height: 56,
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
