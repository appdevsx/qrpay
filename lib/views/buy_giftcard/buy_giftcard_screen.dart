import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/categories_widget/buygift_card_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

import '../../controller/buy_giftcard_controller/buy_giftcard_controller.dart';

class BuyGiftCardScreen extends StatelessWidget {
  BuyGiftCardScreen({super.key});

  final controller = Get.put(BuyGiftCardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.buyGiftcard),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        InkWell(
            onTap: () {
              controller.ontapCard();
            },
            child: const BuyGiftCardWidget()),
      ],
    );
  }
}
