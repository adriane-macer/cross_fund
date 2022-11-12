import 'package:cross_fund/services/configs/config_dependencies.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with StateMixin {
  final configDependencies = Get.find<ConfigDependencies>();

  @override
  void onInit() {
    RxStatus.loading();
    super.onInit();
  }

  @override
  void onReady() {
    handleCountDown();
    super.onReady();
  }

  Future handleCountDown() async {
    await ConfigDependencies.to.initServices();
    final initialPage = await configDependencies.initRoutePage();
    RxStatus.success();
    Get.offAllNamed(initialPage);
  }
}
