import 'package:cross_fund/presentation/screens/buy/buy_screen.dart';
import 'package:cross_fund/presentation/screens/game/game_screen.dart';
import 'package:cross_fund/presentation/screens/home/home_screen.dart';
import 'package:cross_fund/presentation/screens/more/more_screen.dart';
import 'package:cross_fund/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cross_fund/application/controllers/bottom_navigator/bottom_navigator_controller.dart';
import 'package:cross_fund/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:cross_fund/presentation/screens/discover/discover_screen.dart';
import 'package:cross_fund/presentation/screens/menu/menu_widget.dart';
import 'package:cross_fund/presentation/screens/plans/plan_screen.dart';
import 'package:cross_fund/presentation/screens/usage/usage_screen.dart';

class BottomNavigator extends GetView<BottomNavigatorController> {
  final List<_TabItem> _tabItems = [
    _TabItem(
      icon: const Icon(
        Icons.home,
      ),
      title: 'Home',
      widget: const HomeScreen(),
    ),
    _TabItem(
      icon: const Icon(
        Icons.shopping_cart,
      ),
      title: 'Buy',
      widget: const BuyScreen(),
    ),
    _TabItem(
      icon: const Icon(
        Icons.apps_outlined,
      ),
      title: 'More',
      widget: const MoreScreen(),
    ),
    _TabItem(
      icon: const Icon(
        Icons.videogame_asset_outlined,
      ),
      title: 'Games',
      widget: const GameScreen(),
    ),
    _TabItem(
      icon: const Icon(
        Icons.account_circle_outlined,
      ),
      title: 'Profile',
      widget: const ProfileScreen(),
    ),
  ];

  BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _tabItems[controller.currentIndex.value].title,
            ),
            // backgroundColor: Colors.white,
            centerTitle: true, backgroundColor: Theme.of(context).primaryColor,
          ),
          body: _tabItems[controller.currentIndex.value].widget,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            onTap: controller.onTabTapped,
            items: [
              ..._tabItems.map((item) => BottomNavigationBarItem(
                  icon: item.icon,
                  label: item.title,
                  backgroundColor: Theme.of(context).primaryColor))
            ],
          ),
        );
      }),
    );
  }
}

class _TabItem {
  final Icon icon;
  final String title;
  final Widget widget;

  _TabItem({
    required this.icon,
    required this.title,
    required this.widget,
  });
}
