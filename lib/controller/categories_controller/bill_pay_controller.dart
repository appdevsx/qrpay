import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class BillPayController extends GetxController {
  final bilTypeController = TextEditingController();
  final bilNumberController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void dispose() {
    bilTypeController.dispose();
    bilNumberController.dispose();
    amountController.dispose();
    super.dispose();
  }

  RxString selectCurrency = "USD".obs;

  List<String> currencyList = ["USD", "AUD"];

  RxString billCategoryMethod = "selectbillCategory".obs;

  List<String> billCategoryList = [
    "Electicity",
    "Gas",
    "Water",
    "Internet",
    "Telephone",
    "TV",
    "Education",
    "Govt.Fees",
    "Insurance",
    "Others",
  ];

  void onPresedbackToHome() {
    Get.toNamed(Routes.bottomNavBarScreen);
  }
}
