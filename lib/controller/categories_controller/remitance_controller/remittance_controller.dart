import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';

class RemittanceController extends GetxController {
  final sendingCountryController = TextEditingController();
  final receiveCountryController = TextEditingController();
  final receipientCountryController = TextEditingController();
  final receiveMethodCountryController = TextEditingController();
  final sendingAmountCountryController = TextEditingController();
  final receipientGetCountryController = TextEditingController();

  RxString receipientMethod = "Select Receipient".obs;
  List<String> receipientList = ["Ramanso"];

  void onTapADDPlus() {
    Get.toNamed(Routes.addReceipientScreen);
  }
}
