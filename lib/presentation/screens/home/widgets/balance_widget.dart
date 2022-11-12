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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Rewards points".text,
                      Row(
                        children: [const Icon(Icons.star),
                          const SizedBox(width: 4,), "196.24".text],
                      )
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios)
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Balance".text,
                      const SizedBox(
                        width: 8,
                      ),
                      Row(
                        children: [const Icon(Icons.language),
                          const SizedBox(width: 4,),
                          "2000.00".text],
                      )
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
