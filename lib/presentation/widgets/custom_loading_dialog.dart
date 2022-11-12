import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

class CustomLoadingDialog extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? description;

  const CustomLoadingDialog({Key? key, this.title, this.description, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final circularProgressSize = height * 0.1;
    final iconSize = circularProgressSize * 0.6;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: circularProgressSize,
              child: icon == null
                  ? SizedBox(
                      height: circularProgressSize,
                      width: circularProgressSize,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : Stack(
                      children: [
                        SizedBox(
                          height: circularProgressSize,
                          width: circularProgressSize,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Positioned(
                          top: (circularProgressSize - iconSize) / 2,
                          right: (circularProgressSize - iconSize) / 2,
                          child: Icon(
                            icon,
                            size: iconSize,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
            ),
            SizedBox(
              height: height * .01,
            ),
            '${title ?? ''} '.h6,
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      ),
    );
  }
}
