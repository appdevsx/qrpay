import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.profile),
      body: _bodyWidget(context),
    );
  }
  
  _bodyWidget(BuildContext context) {
    
  }
}