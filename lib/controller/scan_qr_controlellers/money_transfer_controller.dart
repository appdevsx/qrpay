import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class MoneyTransferController extends GetxController {
  final qrAddressController = TextEditingController();
  final amountController = TextEditingController();

  RxString selectCurrency = "USD".obs;

  List<String> currencyList = ["USD", "AUD"];

  void onpresedSend() {
    Get.toNamed(Routes.previewScreen);
  }
}
