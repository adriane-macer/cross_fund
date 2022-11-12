import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class CustomItemButtonWidget extends StatelessWidget {
  final BuildContext context;
  final String name;
  final bool selected;
  final VoidCallback onTap;
  final double? nameWidth;

  const CustomItemButtonWidget(
      {Key? key,
      required this.context,
      required this.name,
      required this.selected,
      required this.onTap,
      this.nameWidth = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final boldStyle = TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold);
    final lightStyle = TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w300);

    return Column(
      children: [
        const SizedBox(height: 24),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: selected ? primaryColor : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: BorderSide(color: primaryColor)),
                elevation: 0.0),
            onPressed: onTap,
            child: SizedBox(
              width: nameWidth,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  child: name.text.size(16).styled(style: selected ? boldStyle : lightStyle)
                      .color(selected ? Colors.white : primaryColor)
                      .alignCenter),
            )),
      ],
    );
  }
}
