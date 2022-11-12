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
      title: 'Dashboard',
      widget: const DashboardScreen(),
    ),
    _TabItem(
      icon: const Icon(
        Icons.article_outlined,
      ),
      title: 'Plans',
      widget: PlanScreen(),
    ),
    _TabItem(
      icon: const Icon(
        Icons.diamond_rounded,
      ),
      title: 'Discover',
      widget: DiscoverScreen(),
    ),
    _TabItem(
      icon: const Icon(
        Icons.pie_chart_outline_sharp,
      ),
      title: 'Usage',
      widget: UsageScreen(),
    ),
    _TabItem(
      icon: const Icon(
        Icons.menu,
      ),
      title: 'Menu',
      widget: MenuWidget(),
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
