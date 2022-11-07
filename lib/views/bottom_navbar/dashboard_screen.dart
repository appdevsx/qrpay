import 'package:flutter/material.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/dashboard_appbar.dart';

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
    return Column(
      children: [
         _customAppbar(context),
      ],
    );
  }
  
  _customAppbar(BuildContext context) {
    return DashboardAppBar(
      
      title: Strings.qrpay);
  }
}
