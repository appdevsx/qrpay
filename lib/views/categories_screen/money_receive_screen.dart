import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../controller/categories_controller/money_receive_controller.dart';

class MoneyReceiveScreen extends StatelessWidget {
   MoneyReceiveScreen({super.key});
final controller=Get.put(MoneyReciveController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.moneyReceive),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        _imgWidget(context),
      ],
    );
  }

  _imgWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize ,
          vertical: Dimensions.defaultPaddingSize*1.4),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        ),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.28,
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.marginSize * 1.4,
            horizontal: Dimensions.marginSize,
          ),
          child: Image.asset(
            Assets.qrCode,
          ),
        ),
      ),
    );
  }
}
