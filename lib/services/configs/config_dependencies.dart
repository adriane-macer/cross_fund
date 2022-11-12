
import 'package:cross_fund/services/auth_service.dart';
import 'package:cross_fund/services/configs/app_config.dart';
import 'package:get/get.dart';

class ConfigDependencies extends GetxService {
  static ConfigDependencies get to => Get.find();

  late AppConfig appConfig;

  Future<ConfigDependencies> init({
    required AppConfig appConfig,
  }) async {
    this.appConfig = appConfig;
    return this;
  }

  /// Please initialize this on splash screen controller
  Future<void> initServices() async {
    await authServices();
  }

  /// Please initialize this on splash screen controller
  Future<String> initRoutePage() async {
    return Get.find<AuthService>().initialPage();
  }

  Future<void> authServices() async {
    await Get.putAsync(() => AuthService().init());
  }

}
