import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/dashboard_appbar.dart';

import '../../utils/dimensions.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.dashboard),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              _appbarWidget(context),
              _transactionWidget(context),
              _recipientInformationWIdget(context),
              _amountInformationWIdget(context),
              const Spacer(),
              _buttonWidget(context),
            ],
          ),
        ),
      ],
    );
  }

  _appbarWidget(BuildContext context) {
    return DashboardAppBar(
        elevation: 0,
        centerTitle: false,
        ledeaing: Container(
          padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 0.8),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              Assets.backward,
              color: CustomColor.whiteColor,
              height: Dimensions.heightSize,
            ),
          ),
        ),
        title: Strings.preview);
  }

  _transactionWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 1.8,
      ),
      child: Column(
        children: [
          Text(
            Strings.tRX2136987,
            style: CustomStyle.currentAmountTexStyle,
          ),
          Text(
            Strings.transactionNo,
            style: CustomStyle.transactionTextStyle,
          )
        ],
      ),
    );
  }

  _recipientInformationWIdget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize * 0.8,
        vertical: Dimensions.marginSize,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            CustomColor.whiteColor.withOpacity(0.2),
            CustomColor.whiteColor.withOpacity(0.1)
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.defaultPaddingSize * 0.5,
                left: Dimensions.defaultPaddingSize * 0.6),
            child: Text(
              Strings.recipientInformation,
              style: CustomStyle.recipientInformationTexStyle,
            ),
          ),
          addVerticalSpace(Dimensions.heightSize * 0.5),
          Divider(
            color: CustomColor.primaryColor.withOpacity(0.3),
            height: 2,
          ),
          addVerticalSpace(
            Dimensions.heightSize * 1.6,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPaddingSize * 0.6,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.sayok,
                      style: CustomStyle.nameTexStyle,
                    ),
                    Text(
                      Strings.qrCode,
                      style: CustomStyle.nameTexStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.sayokGmail,
                      style: CustomStyle.qrAddressTextStyle,
                    ),
                    Text(
                      Strings.qrAddress,
                      style: CustomStyle.qrAddressTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _amountInformationWIdget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize * 0.8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            CustomColor.whiteColor.withOpacity(0.1),
            CustomColor.whiteColor.withOpacity(0.1)
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.defaultPaddingSize * 0.5,
                left: Dimensions.defaultPaddingSize * 0.6),
            child: Text(
              Strings.amountInformation,
              style: CustomStyle.recipientInformationTexStyle,
            ),
          ),
          addVerticalSpace(Dimensions.heightSize * 0.5),
          Divider(
            color: CustomColor.primaryColor.withOpacity(0.3),
            height: 2,
          ),
          addVerticalSpace(
            Dimensions.heightSize * 1.6,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPaddingSize * 0.6,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.enteredAmount,
                      style: CustomStyle.costTextStyle,
                    ),
                    Text(
                      Strings.uSD100,
                      style: CustomStyle.amountTextStyle,
                    ),
                  ],
                ),
                addVerticalSpace(Dimensions.heightSize * 0.3),
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.transferFee,
                      style: CustomStyle.costTextStyle,
                    ),
                    Text(
                      Strings.uSD2,
                      style: CustomStyle.amountTextStyle,
                    ),
                  ],
                ),
                addVerticalSpace(Dimensions.heightSize * 0.3),
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.recipientReceived,
                      style: CustomStyle.costTextStyle,
                    ),
                    Text(
                      Strings.uSD98,
                      style: CustomStyle.amountTextStyle,
                    ),
                  ],
                ),
                addVerticalSpace(Dimensions.heightSize * 0.3),
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Text(
                      Strings.totalPayable,
                      style: CustomStyle.costTextStyle,
                    ),
                    Text(
                      Strings.uSD100,
                      style: CustomStyle.amountTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 2),
          topRight: Radius.circular(Dimensions.radius * 2),
        ),
      ),
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.only(
              top: Dimensions.defaultPaddingSize * 1.2,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              bottom: Dimensions.marginSize,
            ),
            height: Dimensions.heightSize * 8,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    CustomColor.whiteColor.withOpacity(0.1),
                    CustomColor.whiteColor.withOpacity(0.1)
                  ],
                  tileMode: TileMode.mirror,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius * 2),
                  topRight: Radius.circular(Dimensions.radius * 2),
                )),
            child: Container(
              height: Dimensions.heightSize * 4.2,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
                
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: mainCenter,
                  children: [
                    SvgPicture.asset(
                      Assets.send,
                      color: CustomColor.whiteColor,
                      height: Dimensions.heightSize * 1.5,
                      width: Dimensions.widthSize * 2,
                    ),
                    addHorizontalSpace(
                      Dimensions.widthSize * 0.7,
                    ),
                    Text(
                      Strings.confirmSend,
                      style: GoogleFonts.inter(
                        fontSize: Dimensions.extraLargeTextSize,
                        color: CustomColor.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
