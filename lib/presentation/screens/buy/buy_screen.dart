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
            color: Colors.white,
            child: TabBar(
              labelColor: Colors.black,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                    icon: const Icon(Icons.food_bank,
                        color: Colors.black, size: 22.0),
                    text: "Invest"),
                Tab(
                    icon: const Icon(Icons.real_estate_agent,
                        color: Colors.black, size: 22.0),
                    text: "Remittance"),
                Tab(
                    icon: const Icon(Icons.link_outlined,
                        color: Colors.black, size: 22.0),
                    text: "ETH-Fiat"),
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
