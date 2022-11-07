import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class KYCFromController extends GetxController {
  final firstNameController = TextEditingController();
  final lasstNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final selectCountryController = TextEditingController();
  final selectCityController = TextEditingController();
  final selectZipController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lasstNameController.dispose();
    emailAddressController.dispose();
    selectCountryController.dispose();
    selectCityController.dispose();
    selectZipController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void onPressedSignIn() {}

  void onPressedUserAgriment() {}

  void onPressedPrivacy() {}
  

  void onPresedcontinue() {
    Get.toNamed(Routes.fingerPrintScreen);
  }
}
