import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/dashboard_appbar.dart';
import 'package:qrpay/widgets/transaction_widget/recen_transaction_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bottom_navbar_widget/categories_widget.dart';

class DashBordScreen extends StatelessWidget {
  const DashBordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.dashboard), fit: BoxFit.cover)),
          ),
          _bodyWidget(context),
        ],
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        _customAppbar(context),
        _currentAmountWidget(context),
        _categoriesWidget(context),
        _recentTransactionWidget(context),
      ],
    );
  }

  _customAppbar(BuildContext context) {
    return DashboardAppBar(
      ledeaing: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.defaultPaddingSize,
              right: Dimensions.defaultPaddingSize * 0.2),
          child: SvgPicture.asset(
            Assets.menu,
            height: 13,
            width: 17,
          ),
        ),
      ),
      title: Strings.qrpay,
      actions: [
        Padding(
          padding: EdgeInsets.only(
              top: Dimensions.defaultPaddingSize * 0.2,
              right: Dimensions.defaultPaddingSize * 0.6),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: CustomColor.primaryColor.withOpacity(0.2),
            child: Image.asset(Assets.profile),
          ),
        )
      ],
    );
  }

  _currentAmountWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize * 2),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          Text(
            Strings.uSD1589,
            style: CustomStyle.currentAmountTexStyle,
          ),
          Text(
            Strings.currentBalance,
            style: CustomStyle.whiteCurrentTextStyle,
          ),
        ],
      ),
    );
  }

  _categoriesWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 2.5,
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: Dimensions.widthSize,
        runSpacing: Dimensions.widthSize * 1.8,
        children: const [
          CategoriesWidget(
            img: Assets.send,
            text: Strings.send,
          ),
          CategoriesWidget(
            img: Assets.receive,
            text: Strings.receive,
          ),
          CategoriesWidget(
            img: Assets.remittance,
            text: Strings.remittance,
          ),
          CategoriesWidget(
            img: Assets.virtualCards,
            text: Strings.virtualCard,
          ),
          CategoriesWidget(
            img: Assets.billPay,
            text: Strings.billPay,
          ),
          CategoriesWidget(
            img: Assets.mobileTopUp,
            text: Strings.mobileTopUp,
          ),
          CategoriesWidget(
            img: Assets.buyGiftCard,
            text: Strings.buyGiftcard,
          ),
          CategoriesWidget(
            img: Assets.myGiftcard,
            text: Strings.myGiftcard,
          ),
        ],
      ),
    );
  }

  _recentTransactionWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
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
