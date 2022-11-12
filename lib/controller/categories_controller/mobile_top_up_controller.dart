import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class MobileTopUpController extends GetxController{

    final mobileTopUpTypeController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void dispose() {
    mobileTopUpTypeController.dispose();
    mobileNumberController.dispose();
    amountController.dispose();
    super.dispose();
  }

  RxString selectCurrency = "USD".obs;

  List<String> currencyList = ["USD", "AUD"];

  RxString topUPMethod = "select Mobile Category".obs;

  List<String> topUpList = [
    "AT&T Mobility",
    "AT&T Mobility",
   
  ];

  void onPresedbackToHome() {
    Get.toNamed(Routes.bottomNavBarScreen);
  }
}