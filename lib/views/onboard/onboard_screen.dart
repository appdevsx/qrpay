// ignore: library_private_types_in_public_api
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:qrpay/routes/routes.dart';
import '../../controller/onboard_controller/onboard_controller.dart';
import '../../data/onbaord_data.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/onboard_widget/onboard_widget.dart';






class OnboardSceen extends StatefulWidget {
  OnboardSceen({super.key});
  final controller = Get.put(OnboardController());
  @override

  
  OnboardBuilder createState() => OnboardBuilder();
}

class OnboardBuilder extends State<OnboardSceen> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: page == 0 ? Colors.grey : Colors.white,
          type: MaterialType.button,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe.builder(
            itemCount: onboardData.length,
            itemBuilder: (context, index) {
              return OnboardWidget(
                bgColor: onboardData[index].bgColor,
                img: onboardData[index].img,
                text1: onboardData[index].text1,
                text2: onboardData[index].text2,
                text3: onboardData[index].text3,
              );
            },
            positionSlideIcon: 0.8,
            slideIconWidget: InkWell(
              onTap: () {
                Get.toNamed(Routes.signUpScreen);
              },
              child: CircleAvatar(
                radius: 17,
                backgroundColor:
                    page == 0 ? CustomColor.whiteColor : CustomColor.blackColor,
                child: CircleAvatar(
                  backgroundColor: page == 0
                      ? CustomColor.primaryColor
                      : CustomColor.whiteColor,
                  radius: 15,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: page == 0
                        ? CustomColor.whiteColor
                        : CustomColor.blackColor,
                  ),
                ),
              ),
            ),
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            fullTransitionValue: 880,
            enableSideReveal: true,
            enableLoop: true,
            ignoreUserGestureWhileAnimating: true,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.defaultPaddingSize * 17,
              right: Dimensions.defaultPaddingSize * 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(onboardData.length, _buildDot),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 1.8,
                  left: Dimensions.defaultPaddingSize),
              child: InkWell(
                onTap: () {
                  liquidController.jumpToPage(
                      page: liquidController.currentPage + 1 >
                              onboardData.length - 1
                          ? 0
                          : liquidController.currentPage + 1);
                },
                child: Text(
                  Strings.qrpay,
                  style: GoogleFonts.inter(
                    fontSize: Dimensions.extraLargeTextSize,
                    fontWeight: FontWeight.w600,
                    color: page == 0
                        ? CustomColor.primaryTextColor
                        : CustomColor.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 1.8,
                  right: Dimensions.defaultPaddingSize),
              child: InkWell(
                onTap: () {
                  liquidController.animateToPage(
                      page: onboardData.length - 1, duration: 700);
                },
                child: Text(
                  Strings.skip,
                  style: GoogleFonts.inter(
                    fontSize: Dimensions.smallTextSize,
                    fontWeight: FontWeight.w500,
                    color: page == 0
                        ? CustomColor.primaryTextColor
                        : CustomColor.whiteColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
