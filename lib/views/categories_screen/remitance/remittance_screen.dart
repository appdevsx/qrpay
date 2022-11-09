import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/controller/categories_controller/remitance_controller/remittance_controller.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/input_widget/country_picker.dart';
import 'package:qrpay/widgets/input_widget/primary_input_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../../utils/custom_color.dart';

class RemittanceScreen extends StatelessWidget {
  RemittanceScreen({super.key});
  final controller = Get.put(RemittanceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.remittance),
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
                labelText: Strings.recipient,
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
              child:GestureDetector (
                onTap: (){
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
      ]),
    );
  }
}
