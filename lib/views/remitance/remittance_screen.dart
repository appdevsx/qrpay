import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/input_widget/country_picker.dart';
import 'package:qrpay/widgets/input_widget/primary_input_widget.dart';
import 'package:qrpay/widgets/others/bottom_sheet_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../../utils/custom_color.dart';
import '../../controller/remitance_controller/remittance_controller.dart';
import '../../widgets/button_widget/primary_button.dart';
import '../../widgets/input_widget/drop_down_input.dart';

class RemittanceScreen extends StatelessWidget {
  RemittanceScreen({super.key});
  final controller = Get.put(RemittanceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.remittance),
      bottomSheet: CustomBottomShet(
        ontap: () {
          showBottomSheet(context);
        },
        text: Strings.send,
        img: Assets.send,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 0.6,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          _inputFieldWidget(),
          _sendingAmountWidet(context),
          _previewWidget(context),
        ],
      );
    });
  }

  _inputFieldWidget() {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize,
      ),
      child: Column(mainAxisAlignment: mainCenter, children: [
        //sending country
        SignUpCountryCodePickerWidget(
          hintText: Strings.selectCountry,
          controller: controller.sendingCountryController,
        ),
        addVerticalSpace(Dimensions.heightSize),
        //receive country
        SignUpCountryCodePickerWidget(
          hintText: Strings.selectCountry,
          controller: controller.receipientCountryController,
        ),
        addVerticalSpace(Dimensions.heightSize),

        //receipient
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Expanded(
              flex: 8,
              child: PrimaryInputWidget(
                controller: controller.receipientCountryController,
                hintText: controller.receipientMethod.value,
                labelText: Strings.receipient,
                suffix: DropdownButton(
                  iconSize: Dimensions.heightSize * 2,
                  dropdownColor: CustomColor.whiteColor,
                  underline: Container(height: 0),
                  items: controller.receipientList
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          color: controller.receipientMethod.value == value
                              ? CustomColor.primaryColor
                              : CustomColor.primaryColor,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    controller.receipientMethod.value = value!;
                  },
                ),
              ),
            ),
            addHorizontalSpace(Dimensions.widthSize * 0.5),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  controller.onTapADDPlus();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: Dimensions.marginSize * 0.4),
                  height: Dimensions.heightSize * 3.6,
                  decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius * 0.5,
                    ),
                  ),
                  child: Text(
                    Strings.addPlus,
                    textAlign: TextAlign.center,
                    style: CustomStyle.addUsdTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
        addVerticalSpace(Dimensions.heightSize),

        //receiving method drop down input
        PrimaryInputWidget(
          controller: controller.receiveMethodCountryController,
          hintText: controller.receivingMethod.value,
          labelText: Strings.recipient,
          suffix: DropdownButton(
            iconSize: Dimensions.heightSize * 2,
            dropdownColor: CustomColor.whiteColor,
            underline: Container(height: 0),
            items:
                controller.receivingList.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value.toString(),
                child: Text(
                  value.toString(),
                  style: TextStyle(
                    color: controller.receivingMethod.value == value
                        ? CustomColor.primaryColor
                        : CustomColor.blackColor,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              controller.receivingMethod.value = value!;
            },
          ),
        ),
        addVerticalSpace(Dimensions.heightSize),
        //bank input widget
        Visibility(
          visible:
              controller.receivingMethod.value == controller.receivingList[1],
          child: PrimaryInputWidget(
            controller: controller.bankCountryController,
            hintText: controller.bankMethod.value,
            labelText: Strings.selectBank,
            suffix: DropdownButton(
              iconSize: Dimensions.heightSize * 2,
              dropdownColor: CustomColor.whiteColor,
              underline: Container(height: 0),
              items: controller.bankList.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      color: controller.bankMethod.value == value
                          ? CustomColor.primaryColor
                          : CustomColor.blackColor,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                controller.bankMethod.value = value!;
              },
            ),
          ),
        ),
        addVerticalSpace(Dimensions.heightSize),
        //select city select street input widget
        Visibility(
          visible:
              controller.receivingMethod.value == controller.receivingList[2],
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Expanded(
                child: DropdownInputWidget(
                  widget: DropdownButton(
                    iconSize: Dimensions.heightSize * 2,
                    dropdownColor: CustomColor.whiteColor,
                    underline: Container(height: 0),
                    items: controller.selectCityList
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(
                          value.toString(),
                          style: TextStyle(
                            color: controller.selectCityMethod.value == value
                                ? CustomColor.primaryColor
                                : CustomColor.primaryColor,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      controller.selectCityMethod.value = value!;
                    },
                  ),
                  controller: controller.selectCityCountryController,
                  hintText: controller.selectCityMethod.value,
                  labelText: Strings.selectCity,
                ),
              ),
              addHorizontalSpace(
                Dimensions.widthSize,
              ),
              Expanded(
                child: DropdownInputWidget(
                  widget: DropdownButton(
                    iconSize: Dimensions.heightSize * 2,
                    dropdownColor: CustomColor.whiteColor,
                    underline: Container(height: 0),
                    items: controller.selectStreetList
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(
                          value.toString(),
                          style: TextStyle(
                            color: controller.selectStreetMethod.value == value
                                ? CustomColor.primaryColor
                                : CustomColor.primaryColor,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      controller.selectStreetMethod.value = value!;
                    },
                  ),
                  controller: controller.selectStreetCountryController,
                  hintText: controller.selectStreetMethod.value,
                  labelText: Strings.selectCity,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

//sending amount
  _sendingAmountWidet(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Expanded(
              flex: 8,
              child: PrimaryInputWidget(
                controller: controller.sendingAmountCountryController,
                hintText: Strings.uSD100,
                labelText: Strings.sendingAmount,
              ),
            ),
            addHorizontalSpace(Dimensions.widthSize * 0.5),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: Dimensions.marginSize * 0.4),
                height: Dimensions.heightSize * 3.5,
                decoration: BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius * 0.5,
                  ),
                ),
                child: Text(
                  Strings.uSD,
                  textAlign: TextAlign.center,
                  style: CustomStyle.addUsdTextStyle,
                ),
              ),
            )
          ],
        ),
        addVerticalSpace(Dimensions.heightSize),
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Expanded(
              flex: 8,
              child: PrimaryInputWidget(
                controller: controller.sendingAmountCountryController,
                hintText: Strings.uSD100,
                labelText: Strings.recipientGet,
              ),
            ),
            addHorizontalSpace(Dimensions.widthSize * 0.5),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: Dimensions.marginSize * 0.4),
                height: Dimensions.heightSize * 3.5,
                decoration: BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius * 0.5,
                  ),
                ),
                child: Text(
                  Strings.aud,
                  textAlign: TextAlign.center,
                  style: CustomStyle.addUsdTextStyle,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  _previewWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.defaultPaddingSize * 0.3),
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 2,
        bottom: Dimensions.marginSize * 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        color: CustomColor.primaryColor.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPaddingSize * 0.6,
            ),
            child: Text(
              Strings.preview,
              style: CustomStyle.smallTextStyle,
            ),
          ),
          const Divider(
            color: CustomColor.whiteColor,
          ),

          //started Row widget

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPaddingSize * 0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.sendingCountry,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.unitedState,
                  style: CustomStyle.smallTextStyle,
                ),
              ],
            ),
          ),
          Divider(
            color: CustomColor.primaryColor.withOpacity(0.3),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPaddingSize * 0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.receivingCountry,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.unitedState,
                  style: CustomStyle.smallTextStyle,
                ),
              ],
            ),
          ),
          Divider(
            color: CustomColor.primaryColor.withOpacity(0.3),
          ),

          //amount
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPaddingSize * 0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.receipient,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.remansoGrip,
                  style: CustomStyle.smallTextStyle,
                ),
              ],
            ),
          ),
          Divider(
            color: CustomColor.primaryColor.withOpacity(0.3),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPaddingSize * 0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.receivingMethod,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.qRPayWallet,
                  style: CustomStyle.smallTextStyle,
                ),
              ],
            ),
          ),
          Divider(
            color: CustomColor.primaryColor.withOpacity(0.3),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPaddingSize * 0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.sendingAmount,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.uSD100,
                  style: CustomStyle.smallTextStyle,
                ),
              ],
            ),
          ),
          Divider(
            color: CustomColor.primaryColor.withOpacity(0.3),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPaddingSize * 0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.transferFee,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.uSD2,
                  style: CustomStyle.smallTextStyle,
                ),
              ],
            ),
          ),

          Divider(
            color: CustomColor.primaryColor.withOpacity(0.3),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPaddingSize * 0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.exchangeRate,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.uSD1Equal,
                  style: CustomStyle.smallTextStyle,
                ),
              ],
            ),
          ),
          Divider(
            color: CustomColor.primaryColor.withOpacity(0.3),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPaddingSize * 0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.recipientReceived,
                  style: CustomStyle.billTypeTextStyle,
                ),
                Text(
                  Strings.usd15,
                  style: CustomStyle.smallTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showBottomSheet(BuildContext context) => showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 1.5),
          topRight: Radius.circular(Dimensions.radius * 1.5),
        )),
        elevation: 0,
        backgroundColor: CustomColor.whiteColor,
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 1.5),
              topRight: Radius.circular(Dimensions.radius * 1.5),
            )),
            padding: EdgeInsets.all(Dimensions.marginSize * 0.9),
            height: MediaQuery.of(context).size.height * 0.42,
            child: Column(
              mainAxisAlignment: mainCenter,
              children: [
                Image.asset(
                  Assets.confirm,
                  height: Dimensions.heightSize * 9,
                  width: Dimensions.heightSize * 10,
                ),
                addVerticalSpace(Dimensions.heightSize),
                Text(
                  Strings.transferSuccess,
                  style: CustomStyle.boldTitleTextStyle,
                ),
                Text(
                  Strings.yourmoneySenSuccess,
                  textAlign: TextAlign.center,
                  style: CustomStyle.defaultSubTitleTextStyle,
                ),
                addVerticalSpace(Dimensions.heightSize * 2),
                PrimaryButtonWidget(
                    text: Strings.backtoHome,
                    onPressed: () {
                      controller.onPresedbackToHome();
                    }),
              ],
            ),
          );
        },
      );
}
