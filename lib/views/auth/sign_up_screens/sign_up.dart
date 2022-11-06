import 'package:flutter/material.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidget(context));
  }

  _bodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        _logoWidget(context),
        _textWidget(context),
      ],
    );
  }

  _logoWidget(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.appLogo,
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.3,
      ),
    );
  }
  
  _textWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
         Text(Strings.welcometo,style: CustomStyle.welcomeTOTextTitle,),
         Text(Strings.qrpay,style: CustomStyle.welcomeTitleTextTitle,),
         Text(Strings.useSecureInstant,style: CustomStyle.welcomeTOTextTitle,),
      ],
    );
  }
}
