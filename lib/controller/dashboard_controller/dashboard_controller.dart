import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class DashBordController extends GetxController {
  void onPresedQRScan() {
    Get.toNamed(Routes.scanQrScreen);
  }
}
