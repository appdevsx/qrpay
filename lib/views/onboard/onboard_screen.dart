// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:qrpay/controller/onboard_controller/onboard_controller.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/onboard_widget/onboard_widget.dart';

import '../../data/onbaord_data.dart';
import '../../utils/dimensions.dart';

class OnboardSceen extends StatelessWidget {
  OnboardSceen({Key? key}) : super(key: key);

  final controller = Get.put(OnboardController());
   final lQcontroller= LiquidController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    // return Obx(() {
    return Stack(
      children: [
        _liquiedSwipeWIdget(context),
        _slideWidget(context),
        _skipWidget(context),
      ],
    );
    // });
  }

  _liquiedSwipeWIdget(BuildContext context) {
    return LiquidSwipe.builder(
      
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
      slideIconWidget: InkWell(
        onTap: (){
          controller.onPressdLiquidBUtton();
        },
        child: const CircleAvatar(
          radius: 20,
          child: CircleAvatar(
            radius: 18,
            child: Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ),
      ),
      
      positionSlideIcon: 0.8,
      onPageChangeCallback: controller.pageChangeCallback,
      waveType: WaveType.liquidReveal,
      liquidController: lQcontroller,
      fullTransitionValue: 888,
      enableSideReveal: true,
      enableLoop: true,
      ignoreUserGestureWhileAnimating: true,
    );
  }

  _slideWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(onboardData.length, _buildDot),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container();
  }

  _skipWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
                top: Dimensions.defaultPaddingSize * 1.8,
                left: Dimensions.defaultPaddingSize),
            child: InkWell(
              onTap: (){
                lQcontroller.jumpToPage(page: 2);
              },
              child: Text(
                Strings.qrpay,
                style: GoogleFonts.inter(
                  fontSize: Dimensions.extraLargeTextSize,
                  fontWeight: FontWeight.w600,
                  color: controller.selectedPageIndex.value == 0
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
            child: Text(
              Strings.skip,
              style: GoogleFonts.inter(
                fontSize: Dimensions.smallTextSize,
                fontWeight: FontWeight.w500,
                color: controller.selectedPageIndex.value == 0
                    ? CustomColor.primaryTextColor
                    : CustomColor.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
