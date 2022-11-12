import 'package:cross_fund/presentation/core/shared/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class FeaturedButtons extends StatelessWidget {
  final List<_FeaturedButton> _buttons = [
    _FeaturedButton(
        icon: Icon(Icons.phone_android, color: CustomColors.primaryColor),
        title: "Buy Load"),
    _FeaturedButton(
        icon: Icon(Icons.production_quantity_limits, color: CustomColors.primaryColor),
        title: "Buy Promos"),
    _FeaturedButton(
        icon: Icon(Icons.money, color: CustomColors.primaryColor),
        title: "Redeem Rewards"),
    _FeaturedButton(
        icon: Icon(Icons.qr_code_scanner, color: CustomColors.primaryColor),
        title: "Pay with points"),
    _FeaturedButton(
        icon: Icon(Icons.wallet, color: CustomColors.primaryColor),
        title: "View vouchers"),
    _FeaturedButton(
        icon: Icon(Icons.document_scanner, color: CustomColors.primaryColor),
        title: "Transaction history"),
    _FeaturedButton(
        icon: Icon(Icons.more_vert, color: CustomColors.primaryColor),
        title: "Discovery more"),
  ];

  FeaturedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ..._buttons.map((e) => Container(
              padding: const EdgeInsets.all(4.0),
              width: 90,
              height: 90,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      e.icon,
                      e.title.text.color(Theme.of(context).primaryColor).alignCenter.size(12)
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

class _FeaturedButton {
  final Icon icon;
  final String title;

  _FeaturedButton({required this.icon, required this.title});
}
