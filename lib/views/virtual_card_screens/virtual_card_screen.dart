import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';
import '../../../widgets/transaction_widget/recen_transaction_widget.dart';
import '../../controller/virtual_card_controller/virtual_card_controller.dart';

class VirtualCardScreen extends StatelessWidget {
  VirtualCardScreen({super.key});
  final controller = Get.put(VirtualCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.virtualCard),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      children: [
        _cardWidget(context),
        _cardCategoriesWidget(context),
        _recentTransWidget(context)
      ],
    );
  }

  _cardWidget(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(top: Dimensions.marginSize),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 0.5,
          vertical: Dimensions.defaultPaddingSize,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff348DFD), Color(0xff0150B1)]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 1.5),
            topRight: Radius.circular(Dimensions.radius * 1.5),
            bottomLeft: Radius.circular(Dimensions.radius * 1.5),
            bottomRight: Radius.circular(Dimensions.radius * 10),
          ),
        ),
        child: Column(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                Text(
                  Strings.qrpay,
                  style: CustomStyle.recipientInformationTexStyle,
                ),
                SvgPicture.asset(Assets.scanqr)
              ],
            ),
            Text(
              "9864 1326 7135 3126",
              style: TextStyle(
                fontFamily: "AgencyFB",
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: CustomColor.whiteColor.withOpacity(0.6),
              ),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: mainCenter,
                  children: [
                    Text(
                      Strings.nineElevent,
                      style: CustomStyle.transactionTextStyle,
                    ),
                    Text(
                      Strings.expiryDate,
                      style: CustomStyle.expiryTextStyle,
                    ),
                  ],
                ),
                addHorizontalSpace(Dimensions.widthSize * 6),
                Column(
                  mainAxisAlignment: mainCenter,
                  children: [
                    Text(
                      Strings.nineSix,
                      style: CustomStyle.transactionTextStyle,
                    ),
                    Text(
                      Strings.cvc,
                      style: CustomStyle.expiryTextStyle,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _cardCategoriesWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              controller.onTapDetails();
            },
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 100),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: CustomColor.whiteColor,
                    child: SvgPicture.asset(Assets.details),
                  ),
                ),
                addVerticalSpace(Dimensions.heightSize * 0.4),
                Text(
                  Strings.details,
                  style: CustomStyle.detailsColorTextStyle,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTapFound();
            },
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 100),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: CustomColor.whiteColor,
                    child: SvgPicture.asset(Assets.found),
                  ),
                ),
                addVerticalSpace(Dimensions.heightSize * 0.4),
                Text(
                  Strings.found,
                  style: CustomStyle.detailsColorTextStyle,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.onTapTransaction();
            },
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 100),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: CustomColor.whiteColor,
                    child: SvgPicture.asset(Assets.transaction),
                  ),
                ),
                addVerticalSpace(Dimensions.heightSize * 0.4),
                Text(
                  Strings.transaction,
                  style: CustomStyle.detailsColorTextStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _recentTransWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize),
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Dimensions.radius * 1.5,
          ),
          topRight: Radius.circular(
            Dimensions.radius * 1.5,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            addVerticalSpace(Dimensions.heightSize),
            Text(
              Strings.recentTransactions,
              style: CustomStyle.recentTransactionTextStyle,
            ),
            addVerticalSpace(Dimensions.heightSize),
            const TransactionWidget(
              amount: Strings.aud150,
              img: Assets.sendHistory,
              title: Strings.moneySend,
              subTitle: Strings.tN20236,
              dateText: Strings.firstOct,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),
            const TransactionWidget(
              amount: Strings.usd269,
              img: Assets.receiveHistory,
              title: Strings.moneyReceive,
              subTitle: Strings.tN20236,
              dateText: Strings.sep29,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),
            const TransactionWidget(
              amount: Strings.uSD100,
              img: Assets.sendHistory,
              title: Strings.moneySend,
              subTitle: Strings.tN20236,
              dateText: Strings.firstOct,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),
            const TransactionWidget(
              amount: Strings.usd269,
              img: Assets.receiveHistory,
              title: Strings.moneyReceive,
              subTitle: Strings.tN20236,
              dateText: Strings.sep29,
            ),
            addVerticalSpace(
              Dimensions.heightSize,
            ),
          ],
        ),
      ),
    );
  }
}
