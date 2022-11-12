import 'package:cross_fund/services/data/product_service.dart';
import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class InvestList extends StatelessWidget {
  const InvestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = ProductService.to.list;
    return Column(
      children: [
        ...products.map((e) => Card(
          child: ListTile(
                title: e.name.text,
                leading: Image.network(e.image),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    e.description.text,
                    e.attributes.first.value.toString().text
                  ],
                ),
              ),
        ))
      ],
    );
  }
}
