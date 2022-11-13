import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../../controller/scan_qr_controlellers/scan_qr_controller.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';

class ScanQrScreen extends StatelessWidget {
   ScanQrScreen({super.key});
  final controller=Get.put(ScanQRController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.scanQR),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        _scanerWidget(context),
        const Spacer(),
        _iconButtonWidget(context),
      ],
    );
  }

  _scanerWidget(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(Dimensions.marginSize * 3),
      child: DottedBorder(
        color: CustomColor.primaryColor,
        // dashPattern: const [100, 90],
        dashPattern: const [90, 90, 100, 90],
        strokeWidth: 5,

        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.555,
          child: Center(
            child: Column(
              mainAxisAlignment: mainCenter,
              crossAxisAlignment: crossCenter,
              children: [
                Image.asset(
                  Assets.qrCode,
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _iconButtonWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
      margin: EdgeInsets.only(
        bottom: Dimensions.marginSize * 2,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
       GestureDetector (
        onTap:(){
           controller.onPresedEdit();
        },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: CustomColor.primaryColor,
            child: SvgPicture.asset(
              Assets.edit,
              color: CustomColor.whiteColor,
            ),
          ),
        ),
       GestureDetector (
         onTap:(){
           controller.onPresedScaner();
        },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: CustomColor.primaryColor,
            child: SvgPicture.asset(
              Assets.scanqr,
              color: CustomColor.whiteColor,
            ),
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: CustomColor.primaryColor,
          child: SvgPicture.asset(
            Assets.torch,
            color: CustomColor.whiteColor,
          ),
        ),
      ]),
    );
  }
}
