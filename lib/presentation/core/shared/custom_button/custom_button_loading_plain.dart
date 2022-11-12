import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class CustomButtonLoadingPlain extends StatelessWidget {
  final VoidCallback? onClicked;
  final String? title;
  final Widget? titleWidget;
  final Color? color;
  final bool isLoading;

  const CustomButtonLoadingPlain({
    super.key,
    this.onClicked,
    required this.title,
    this.titleWidget,
    required this.isLoading,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color ?? Theme.of(context).primaryColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: onClicked,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!isLoading)
                    titleWidget ??
                        title
                            .toString()
                            .toUpperCase()
                            .h6
                            .bold
                            .color(Colors.white)
                            .alignCenter,
                  if (isLoading)
                    CircularProgressIndicator(
                      color: color ?? Theme.of(context).primaryColor,
                    )
                ],
              )),
        ));
  }
}
