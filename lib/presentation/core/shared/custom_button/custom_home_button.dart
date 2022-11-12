import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

class CustomHomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onClicked;
  final IconData icon;
  final double? iconSize;
  final double? buttonSize;
  final double borderRadius;
  final double iconAndTextPadding;

  const CustomHomeButton({
    Key? key,
    this.borderRadius = 30,
    this.iconAndTextPadding = 20,
    required this.title,
    required this.onClicked,
    required this.icon,
    this.iconSize,
    this.buttonSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxSized = buttonSize ?? Get.width * .35;
    final iconSized = iconSize ?? Get.width * .08;

    return SizedBox(
      width: boxSized,
      height: boxSized,
      child: ElevatedButton(
          onPressed: onClicked,
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: EdgeInsets.zero,
          ),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: iconSized,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10)
                      .copyWith(top: iconAndTextPadding),
                  child: title.text.alignCenter.maxLine(2).overflowEllipsis,
                )
              ],
            ),
          )),
    );

    // return SizedBox(
    //   width: boxSized,
    //   height: boxSized,
    //   child: CustomButtonPrimaryGradient(
    //       colorFirst: Theme.of(context).primaryColor,
    //       colorSecond: Theme.of(context).primaryColor,
    //       elevetion: 2,
    //       onClicked: onClicked,
    //       title: SizedBox(
    //         width: buttonSize ?? Get.width * .35,
    //         height: buttonSize ?? Get.width * .35,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Icon(
    //               icon,
    //               size: iconSize ?? Get.width * .08,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 20),
    //               child: title.text.alignCenter,
    //             )
    //           ],
    //         ),
    //       )),
    // );
  }
}
