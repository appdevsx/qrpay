import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/input_widget/primary_input_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../controller/scan_qr_controlellers/money_transfer_controller.dart';

class MoneyTransferScreen extends StatelessWidget {
  MoneyTransferScreen({super.key});

  final controller = Get.put(MoneyTransferController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.moneyTransfer),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      children: [_inputWidget(context)],
    );
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius*1.5,),
              color: CustomColor.primaryColor.withOpacity(0.3),
            ),
            child: Text(Strings.paste,style: CustomStyle.priColorTextStyle,),
          ),
        ),
        addVerticalSpace(Dimensions.heightSize),
      ]),
    );
  }
}
