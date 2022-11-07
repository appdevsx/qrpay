// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:qrpay/views/auth/sign_in_screens/reset_password.dart';
import 'package:qrpay/views/auth/sign_in_screens/sign_in_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/facelock_enter_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/facelock_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/fingerprint_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/kyc_from_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/otp_verification_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/sign_up.dart';
import 'package:qrpay/views/onboard/onboard_screen.dart';
import '../binding/splash_binding.dart';
import '../controller/splsh_controller/splash_controller.dart';
import '../views/auth/sign_in_screens/sign_in_options_screen.dart';
import '../views/auth/sign_in_screens/signin_otp_verification.dart';
import '../views/bottom_navbar/bottom_navbar.dart';
import '../views/bottom_navbar/dashboard_screen.dart';
import '../views/confirmation_screens/confirmation_screen.dart';
import '../views/confirmation_screens/wait_for_aproval_screen.dart';
import '../views/scan_qr_screens/money_transfer_screen.dart';
import '../views/splash_screen/splash_screen.dart';
import 'routes.dart';

class Pages {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(
          SplashController(),
        );
      }),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => OnboardSceen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.otpVerificationScreen,
      page: () => OtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.kYCFromScreen,
      page: () => KYCFromScreen(),
    ),
    GetPage(
      name: Routes.fingerPrintScreen,
      page: () => FingerPrintScreen(),
    ),
    GetPage(
      name: Routes.facelockScreen,
      page: () => FacelockScreen(),
    ),
    GetPage(
      name: Routes.facelockEnterScreen,
      page: () => FacelockEnterScreen(),
    ),
    GetPage(
      name: Routes.waitForApprovalScreen,
      page: () => WaitForApprovalScreen(),
    ),
    GetPage(
      name: Routes.signInOptionsScreen,
      page: () => SignInOptionsScreen(),
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.signinOTPVerificationScreen,
      page: () => SigninOTPVerificationScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),
      GetPage(
      name: Routes.congratulationScreen,
      page: () => CongratulationScreen(),
    ),
      GetPage(
      name: Routes.bottomNavBarScreen,
      page: () => BottomNavBarScreen(),
    ),
     GetPage(
      name: Routes.dashBordScreen,
      page: () => const DashBordScreen(),
    ),
     GetPage(
      name: Routes.moneyTransferScreen,
      page: () =>  MoneyTransferScreen(),
    ),
  ];
}
