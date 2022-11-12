import 'package:cross_fund/presentation/screens/buy/widgets/eth_fiat_page.dart';
import 'package:cross_fund/presentation/screens/buy/widgets/invest_list.dart';
import 'package:cross_fund/presentation/screens/buy/widgets/remittance_list.dart';
import 'package:cross_fund/services/data/product_service.dart';
import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = ProductService.to.list;

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            child: Image.asset("assets/images/header_buy.png"),
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(text: "Invest"),
                Tab(text: "Remittance"),
                Tab(text: "ETH-Fiat"),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(children: <Widget>[
              InvestList(),
              RemittanceList(),
              EthFiatPage()
            ]),
          )
        ],
      ),
    );

    // return Column(
    //   children: [...products.map((e) => Card(child: e.name.text))],
    // );
  }
}
