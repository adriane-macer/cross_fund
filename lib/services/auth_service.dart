import 'package:cross_fund/presentation/navigation/navigation.dart';
import 'package:cross_fund/presentation/navigation/routes.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  Future<AuthService> init() async {
    return this;
  }

  Future<bool> checkAuthState() async {
    // TODO  : implement code here
    return false;
  }

  Future<String> initialPage() async {
    return getFirstRoute();
  }

  Future<String> getFirstRoute() async {
    // TODO (AE 12/11/2022) : Temporary Skipped login
    return Routes.bottomNavigator;

    // final value = await checkAuthState();

    // if (value) {
    //   return Routes.home;
    // }
    // return Nav.initialPage;
  }

  void signOut() {
    // TODO : implement code here
    Get.offAllNamed(Nav.initialPage);
  }
}
