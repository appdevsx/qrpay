import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class FoundController extends GetxController {
  RxString selectCurrency = "USD".obs;

  List<String> currencyList = ["USD", "AUD"];

  void onPresedbackToHome() {
    Get.toNamed(Routes.bottomNavBarScreen);
  }
}
