import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/button_widget/primary_button.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../../controller/auth/sign_up_controllers/facelock_capture_controller.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';

class FacelockEnterScreen extends StatelessWidget {
  FacelockEnterScreen({super.key});
  final controller = Get.put(FacelockColotroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.facelock),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          _textWidget(context),
          _imgWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _textWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.facelockAuthentication,
          style: CustomStyle.boldTitleTextStyle,
        ),
        Text(
          Strings.useFacelockSystem,
          style: CustomStyle.defaultSubTitleTextStyle,
        ),
      ],
    );
  }

  _imgWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSize * 3.5,
      ),
      child: Column(
        children: [
          DottedBorder(
            color: CustomColor.primaryColor.withOpacity(0.6),
            // dashPattern: const [100, 90],
            dashPattern: const [90, 90, 100, 90],
            strokeWidth: 5,

            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(Dimensions.marginSize*0.3),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      Assets.person1,
                    ),
                    fit: BoxFit.cover),
              ),
              child: SvgPicture.asset(
                Assets.camera,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        PrimaryButtonWidget(
          text: Strings.confirm,
          onPressed: () {
            controller.onPressedconfirm();
          },
        ),
        addVerticalSpace(
          Dimensions.heightSize * 2,
        ),
        InkWell(
          onTap: () {
            controller.onPressedSkipNow();
          },
          child: Text(
            Strings.skipNow,
            style: CustomStyle.resendTextStyle,
          ),
        ),
      ],
    );
  }
}
