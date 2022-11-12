import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/controller/categories_controller/remitance_controller/remittance_controller.dart';
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

class RemittanceScreen extends StatelessWidget {
  RemittanceScreen({super.key});
  final controller = Get.put(RemittanceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.remittance),
      bottomSheet: CustomBottomShet(
        ontap: () {},
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
                  height: Dimensions.heightSize * 3.9,
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
         visible: controller.receivingMethod.value==controller.receivingList[1],
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
                child: PrimaryInputWidget(
                  controller: controller.selectCityCountryController,
                  hintText: controller.selectCityMethod.value,
                  labelText: Strings.selectCity,
                  suffix: DropdownButton(
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
                                : CustomColor.blackColor,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      controller.selectCityMethod.value = value!;
                    },
                  ),
                ),
              ),
              addHorizontalSpace(
                Dimensions.widthSize,
              ),
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.selectStreetCountryController,
                  hintText: controller.selectStreetMethod.value,
                  labelText: Strings.selectStreet,
                  suffix: DropdownButton(
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
                                : CustomColor.blackColor,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      controller.selectStreetMethod.value = value!;
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

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
              child: GestureDetector(
                onTap: () {
                  controller.onTapADDPlus();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: Dimensions.marginSize * 0.4),
                  height: Dimensions.heightSize * 3.9,
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
              child: GestureDetector(
                onTap: () {
                  controller.onTapADDPlus();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: Dimensions.marginSize * 0.4),
                  height: Dimensions.heightSize * 3.9,
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
              ),
            )
          ],
        ),
      ],
    );
  }
}
