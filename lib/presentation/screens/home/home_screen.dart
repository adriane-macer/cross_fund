import 'package:cross_fund/presentation/screens/home/widgets/balance_widget.dart';
import 'package:cross_fund/presentation/screens/home/widgets/featured_buttons.dart';
import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: "Juan dela Cruz".text,
            accountEmail: "juandelacruz@crossfund.com".text,
            currentAccountPicture: const Icon(
              Icons.account_circle_outlined,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          const BalanceWidget(),
          const SizedBox(
            height: 24.0,
          ),
          FeaturedButtons(),
        ],
      ),
    );
  }
}
