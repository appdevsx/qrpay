// ignore: file_names
import 'package:get/get.dart';
import '../../../routes/routes.dart';

class FingerPrintColotroller extends GetxController {
  void onPressedSkipNow() {
    Get.toNamed(Routes.signInOptionsScreen);
  }

  void onPressedConfirm() {
    Get.toNamed(Routes.facelockScreen);
  }
}
