import 'package:flutter/material.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/assets.dart';

class FingerPrintScreen extends StatelessWidget {
  const FingerPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.fingerprint),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize * 0.6,
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          _textWidget(context),
          _imgWidget(context),
        ],
      ),
    );
  }

  _textWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.fingerprintAuthentication,
          style: CustomStyle.boldTitleTextStyle,
        ),
        Text(
          Strings.useFingerPrintSystem,
          style: CustomStyle.defaultSubTitleTextStyle,
        ),
      ],
    );
  }

  _imgWidget(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.fingerlock),
      ],
    );
  }
}
