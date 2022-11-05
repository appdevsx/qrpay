import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:qrpay/controller/onboard_controller/onboard_controller.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/widgets/onboard_widget/onboard_widget.dart';

import '../../data/onbaord_data.dart';
import '../../utils/custom_color.dart';

final controler = Get.put(OnboardController());

class OnboardSceen extends StatefulWidget {
  const OnboardSceen({Key? key}) : super(key: key);

  @override
  _OnboardSceen createState() => _OnboardSceen();
}

class _OnboardSceen extends State<OnboardSceen> {
  late LiquidController liquidController;
  late UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

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
      positionSlideIcon: 0.8,
      slideIconWidget: const Icon(Icons.arrow_back_ios),
      onPageChangeCallback: controler.pageChangeCallback,
      waveType: WaveType.liquidReveal,
      liquidController: liquidController,
      fullTransitionValue: 880,
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

  _skipWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: () {
                liquidController.jumpToPage(
                    page: liquidController.currentPage + 1 >
                            onboardData.length - 1
                        ? 0
                        : liquidController.currentPage + 1);
              },
              child: const Text("Next"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: () {
                liquidController.animateToPage(
                    page: onboardData.length - 1, duration: 700);
              },
              child:  const Text("Skip to End"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controler.page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: CustomColor.secondaryTextColor,
          type: MaterialType.card,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }
}
