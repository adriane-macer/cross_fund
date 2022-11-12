import 'package:flutter/material.dart';

class EthFiatPage extends StatelessWidget {
  const EthFiatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/eth_fiat.png",
      fit: BoxFit.fitWidth,
    );
  }
}
