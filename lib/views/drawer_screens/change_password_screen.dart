import 'package:flutter/material.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.changePassword),
    );
  }
}