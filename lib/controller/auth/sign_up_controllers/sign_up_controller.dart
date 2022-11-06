import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class SignUpController extends GetxController {
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
RxString countryCode = ''.obs;
  void onPressedContinue() {
    Get.toNamed(Routes.otpVerificationScreen);
  }

  void onPressedSignIn() {}
}
