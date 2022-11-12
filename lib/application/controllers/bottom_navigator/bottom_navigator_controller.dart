import 'package:get/get.dart';

class BottomNavigatorController extends GetxController with StateMixin {
  RxInt currentIndex = 0.obs;
  RxBool menuDisplayed = false.obs;

  void onTabTapped(int index) {
    menuDisplayed.value = false;
    currentIndex.value = index;
  }
}
