// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:qrpay/views/onboard/onboard_screen.dart';
import '../binding/splash_binding.dart';
import '../controller/splsh_controller/splash_controller.dart';
import '../views/splash_screen/splash_screen.dart';
import 'routes.dart';

class Pages {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () =>    const SplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(
          SplashController(),
        );
      }),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () =>   OnboardSceen(),
    ),
  ];
}
