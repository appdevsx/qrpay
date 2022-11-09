import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class DashBoardController extends GetxController {
  void onTabreceiveMoney() {
    Get.toNamed(Routes.moneyReceiveScreen);
  }

  void onTapSend() {
    Get.toNamed(Routes.moneyTransferScreen);
  }

  void onTapRemittance() {
    Get.toNamed(Routes.remittanceScreen);
  }

  void onTapVirtualCard() {}

  void onTapBillPay() {}

  void onTapMobileTopUp() {}

  void onTapBuyGift() {}

  void onTapMyGift() {}
}
