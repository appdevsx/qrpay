import 'package:flutter/material.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

class BillPaymentLogScreen extends StatelessWidget {
  const BillPaymentLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.billPaymentLog),
      body: _bodyWidget(context),
    );
  }
  
  _bodyWidget(BuildContext context) {
  
  }
}
