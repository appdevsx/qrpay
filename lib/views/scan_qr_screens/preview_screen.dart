import 'package:flutter/material.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/bottom_sheet_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings.preview,
      ),
      bottomSheet: CustomBottomShet(
        ontap: () {},
        text: Strings.confirmSend,
        img: Assets.send,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
     
      children: [
        _amountInformationWidget(context),
      ],
    );
  }

  _amountInformationWidget(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 5,
      ),
      child: Column(
         crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.defaultPaddingSize * 0.6,
            ),
            child: Text(
              Strings.amountInformation,
              style: CustomStyle.feeTextStyle,
            ),
          ),
          addVerticalSpace(Dimensions.heightSize * 0.6),
          Divider(
            color: CustomColor.borderColor.withOpacity(0.6),
            height: 1.5,
          ),  addVerticalSpace(Dimensions.heightSize * 0.6),
          _amountWidget(context),
        ],
      ),
    );
  }

  _amountWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.heightSize,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Text(
                Strings.enteredAmount,
                style: CustomStyle.feeTextStyle,
              ),
              Text(
                Strings.uSD100,
                style: CustomStyle.feeTextStyle,
              ),
            ],
          ),
           Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Text(
                Strings.enteredAmount,
                style: CustomStyle.feeTextStyle,
              ),
              Text(
                Strings.uSD100,
                style: CustomStyle.feeTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
