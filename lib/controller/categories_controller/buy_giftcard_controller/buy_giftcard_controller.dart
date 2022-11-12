import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class BuyGiftCardController extends GetxController {
  void ontapCard() {
    Get.toNamed(Routes.cardViewScreen);
  }
}
