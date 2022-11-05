import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/onbaord_data.dart';

class OnboardController extends GetxController {


  int page = 0;
  pageChangeCallback(int lpage) {
   page= lpage;
  }





  var selectedPageIndex = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == onboardData.length;
  bool get isFirstPage => selectedPageIndex.value == 0;
  bool get isSecondPage => selectedPageIndex.value == 1;
  bool get isThirdPage => selectedPageIndex.value == 2;

  void nextPage() {
    if (isLastPage) {
    } else {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.ease,
      );
    }
  }

  void backPage() {
    pageController.previousPage(
      duration: 300.milliseconds,
      curve: Curves.ease,
    );
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
