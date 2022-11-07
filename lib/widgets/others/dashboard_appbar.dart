import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/assets.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

// ignore: must_be_immutable
class DashboardAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  List<Widget>? actions;

  final double elevation;

  DashboardAppBar({
    Key? key,
    required this.title,
    this.elevation = 2,
    this.actions,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(onTap: () {}, child: SvgPicture.asset(Assets.menu)),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: CustomColor.whiteColor,
          fontSize: Dimensions.extraLargeTextSize,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0,
      actions: actions,
      centerTitle: true,
      backgroundColor: CustomColor.transparentColor,
    );
  }
}
