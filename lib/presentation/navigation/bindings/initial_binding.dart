import 'package:cross_fund/services/configs/app_config.dart';
import 'package:cross_fund/services/configs/config_dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("InitialBindings");
  }
}
