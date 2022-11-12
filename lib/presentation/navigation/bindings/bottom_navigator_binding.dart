import 'package:get/get.dart';
import 'package:cross_fund/application/controllers/bottom_navigator/bottom_navigator_controller.dart';

class BottomNavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigatorController>(
      () => BottomNavigatorController(),
    );
  }
}
