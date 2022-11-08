import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/input_widget/primary_input_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../controller/scan_qr_controlellers/money_transfer_controller.dart';
import '../../widgets/others/bottom_sheet_widget.dart';

class MoneyTransferScreen extends StatelessWidget {
  MoneyTransferScreen({super.key});

  final controller = Get.put(MoneyTransferController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.moneyTransfer),
     
      bottomSheet:
          CustomBottomShet(ontap: () {
              controller.onpresedSend();
          }, text: Strings.send, img: Assets.send,),

           body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 0.6,
        ),
        children: [
          _inputWidget(context),
          _textWidget(context),
        ],
      );
    });
  }

  _inputWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize),
      child: Column(children: [
        PrimaryInputWidget(
          controller: controller.qrAddressController,
          hintText: Strings.qrCode,
          labelText: Strings.qrAddress,
          suffix: Container(
            height: Dimensions.heightSize * 1.9,
            width: Dimensions.widthSize * 6,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.radius * 1.5,
              ),
              color: CustomColor.primaryColor.withOpacity(0.3),
            ),
            child: Text(
              Strings.paste,
              style: CustomStyle.priColorTextStyle,
            ),
          ),
        ),
        addVerticalSpace(Dimensions.heightSize),
        Row(
          mainAxisAlignment: mainCenter,
          children: [
            Expanded(
              flex: 6,
              child: PrimaryInputWidget(
                controller: controller.amountController,
                hintText: Strings.zero00,
                labelText: Strings.amount,
              ),
            ),
            addHorizontalSpace(
              Dimensions.widthSize,
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.marginSize * 0.33),
                height: Dimensions.heightSize * 3.7,
                width: Dimensions.widthSize * 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius * 0.5,
                  ),
                  color: CustomColor.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: mainCenter,
                  children: [
                    Text(
                      controller.selectGender.value,
                      style: CustomStyle.whiteColorTextStyle,
                    ),
                    addHorizontalSpace(0),
                    DropdownButton(
                      alignment: Alignment.topLeft,
                      iconEnabledColor: CustomColor.whiteColor,
                      iconSize: Dimensions.heightSize * 2,
                      dropdownColor: CustomColor.whiteColor,
                      underline: Container(height: 0),
                      items: controller.genderList
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(
                            value.toString(),
                            style: TextStyle(
                              color: controller.selectGender.value == value
                                  ? CustomColor.primaryColor
                                  : CustomColor.primaryTextColor,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        controller.selectGender.value = value!;
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  _textWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Row(
          children: [
            Text(
              Strings.transferFee,
              style: CustomStyle.transferFeeTextStyle,
            ),
            Text(
              Strings.uSD2,
              style: CustomStyle.amountColorTextStyle,
            ),
          ],
        ),
        addVerticalSpace(Dimensions.heightSize * 0.5),
        Row(
          children: [
            Text(
              Strings.limit,
              style: CustomStyle.transferFeeTextStyle,
            ),
            Text(
              Strings.limitAmount,
              style: CustomStyle.amountColorTextStyle,
            ),
          ],
        )
      ],
    );
  }
}
