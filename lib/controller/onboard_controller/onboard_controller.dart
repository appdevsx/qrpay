import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:qrpay/routes/routes.dart';


class OnboardController extends GetxController {



  final liquidController = LiquidController();

  RxInt currentPage = 0.obs;
  pageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }
   skip()=>liquidController.jumpToPage(page: 2);



void onPressdLiquidBUtton() {
    Get.toNamed(Routes.signUpScreen);
  }








 
}
