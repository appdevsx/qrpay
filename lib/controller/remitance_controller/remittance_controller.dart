import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/routes/routes.dart';
import 'package:qrpay/utils/strings.dart';

class RemittanceController extends GetxController {
  final sendingCountryController = TextEditingController();
  final receiveCountryController = TextEditingController();
  final receipientCountryController = TextEditingController();
  final receiveMethodCountryController = TextEditingController();
  final sendingAmountCountryController = TextEditingController();
  final receipientGetCountryController = TextEditingController();
  final bankCountryController = TextEditingController();
  final selectCityCountryController = TextEditingController();
  final selectStreetCountryController = TextEditingController();
  RxString receipientMethod = "Select Receipient".obs;
  List<String> receipientList = ["Ramanso"];

//select receiving method drop down
  RxString receivingMethod = Strings.selectMethod.obs;
  List<String> receivingList = [
    Strings.qRPayWallet,
    Strings.bankDeposit,
    Strings.cashPickup,
  ];

//select bank drop down
  RxString bankMethod = Strings.americanBank.obs;
  List<String> bankList = [
    Strings.americanBank,
    Strings.americanBank,
    Strings.americanBank,
  ];
//select city 
    RxString selectCityMethod = Strings.selectCity.obs;
  List<String> selectCityList = ["Kabul", "Herat"];

   RxString selectStreetMethod = "adilade.N".obs;
  List<String> selectStreetList = [
   "adilade",
   "road.N",
  ];

  void onTapADDPlus() {
    Get.toNamed(Routes.addReceipientScreen);
  }
}
