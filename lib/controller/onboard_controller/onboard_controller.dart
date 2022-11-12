import 'package:get/get.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:qrpay/data/onbaord_data.dart';
import 'package:qrpay/routes/routes.dart';

class OnboardController extends GetxController {
  var page = onboardData.length.obs;

  pageChangeCallback(var lpage) {
    page = lpage;
  }

  late final UpdateType updateType;

  var liquidController = LiquidController();

  void onPressdLiquidBUtton() {
    Get.toNamed(Routes.signUpScreen);
  }

// navigate to the welcome screen
  // pageNavigate() {
  //   Get.toNamed(Routes.welcomeScreen);
  // }

  // button widget with color and size
//   buttonWidget() {
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 3),
//       child: Center(
//           child: InkWell(
//         onTap: () {
//           isFirstPage || isSecondPage ? nextPage() : pageNavigate();
//         },
//         child: SvgPicture.asset(
//           Assets.forwardButton,
//           height: Dimensions.heightSize * 4,
//         ),
//       )),
//     );
//   }
// }
}
