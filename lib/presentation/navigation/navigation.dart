import 'package:cross_fund/presentation/navigation/bindings/bottom_navigator_binding.dart';
import 'package:cross_fund/presentation/navigation/bindings/login_binding.dart';
import 'package:cross_fund/presentation/navigation/bindings/splash_binding.dart';
import 'package:cross_fund/presentation/navigation/bottom_navigator.dart';
import 'package:cross_fund/presentation/navigation/routes.dart';
import 'package:cross_fund/presentation/screens/login/login_screen.dart';
import 'package:cross_fund/presentation/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class Nav {
  static const String initialPage = Routes.login;
  static const String splashPage = Routes.splash;
  static const String homePage = Routes.home;
  static List<GetPage> routes = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.bottomNavigator,
      page: () => BottomNavigator(),
      binding: BottomNavigatorBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
