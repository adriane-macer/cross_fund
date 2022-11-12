import 'package:cross_fund/presentation/core/helpers/theme_helper.dart';
import 'package:cross_fund/presentation/core/shared/custom_colors.dart';
import 'package:cross_fund/presentation/core/shared/custom_theme.dart';
import 'package:cross_fund/presentation/navigation/bindings/initial_binding.dart';
import 'package:cross_fund/presentation/navigation/navigation.dart';
import 'package:cross_fund/services/configs/app_config.dart';
import 'package:cross_fund/services/configs/config_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

Future<void> main() async {
  const appConfig = AppConfig(appName: "Cross coins", baseUrl: "");
  await Get.putAsync(
    () async => ConfigDependencies().init(appConfig: appConfig),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Cross funds",
        initialBinding: InitialBindings(),
        debugShowCheckedModeBanner: false,
        initialRoute: Nav.splashPage,
        getPages: Nav.routes,
        theme: ThemeHelper.setFontFamily(
            context, CustomTheme.lightTheme, "Open Sans"),
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ]);
  }
}
