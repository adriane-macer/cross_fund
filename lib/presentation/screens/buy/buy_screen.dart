import 'package:cross_fund/services/data/product_service.dart';
import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = ProductService.to.list;
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [...products.map((e) => e.name.text)],
          ),
        ));
  }
}
