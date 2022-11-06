import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_color.dart';
import 'dimensions.dart';

class CustomStyle {
  //auth screens
  static var welcomeTOTextTitle = GoogleFonts.inter(
    color: CustomColor.thirdTextColor,
    fontSize: Dimensions.onboardsubTitle,
    fontWeight: FontWeight.w500,
  );
static var welcomeTitleTextTitle = GoogleFonts.inter(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.titleText,
    fontWeight: FontWeight.w700,
  );
}
