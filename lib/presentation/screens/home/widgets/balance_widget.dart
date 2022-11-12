import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      "Rewards points".text,
                      Row(
                        children: [Icon(Icons.star), "196.24".text],
                      )
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      "Balance".text,
                      SizedBox(
                        width: 8,
                      ),
                      Row(
                        children: [Icon(Icons.language), "2000.00".text],
                      )
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
