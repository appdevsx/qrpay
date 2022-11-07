// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:qrpay/views/auth/sign_up_screens/fingerprint_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/kyc_from_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/otp_verification_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/sign_up.dart';
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
    GetPage(
      name: Routes.signUpScreen,
      page: () =>    SignUpScreen(),
    ),
     GetPage(
      name: Routes.otpVerificationScreen,
      page: () =>    OtpVerificationScreen(),
    ),
      GetPage(
      name: Routes.kYCFromScreen,
      page: () =>    KYCFromScreen(),
    ),
      GetPage(
      name: Routes.fingerPrintScreen,
      page: () =>    const FingerPrintScreen(),
    ),
  ];
}
