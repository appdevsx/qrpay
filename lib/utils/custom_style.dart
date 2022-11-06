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
  static var defaultTitleTextTitle = GoogleFonts.inter(
    color: CustomColor.secondaryTextColor,
    fontSize: Dimensions.largeTextSize,
    fontWeight: FontWeight.w600,
  );
  static var inputTextStyle = GoogleFonts.inter(
    color: CustomColor.primaryColor.withOpacity(0.6),
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
  );
   static var labelTextStyle = GoogleFonts.inter(
    color: CustomColor.primaryColor.withOpacity(0.6),
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
  );
   static var hintTextStyle = GoogleFonts.inter(
    color: CustomColor.borderColor,
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
  );
  //otp verification
  static var boldTitleTextStyle = GoogleFonts.inter(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.onboardsubTitle,
    fontWeight: FontWeight.w700,
  );

    static var oTPsubTitleTextStyle = GoogleFonts.inter(
    color: CustomColor.thirdTextColor,
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w500,
  );
   static var resendTextStyle = GoogleFonts.inter(
    color: CustomColor.primaryTextColor,
     fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.w600,
  );

  //kyc from
  static var borderColorText = GoogleFonts.inter(
    color: CustomColor.borderColor,
     fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
  );
   static var smallestTExtStyle = GoogleFonts.inter(
    color: CustomColor.secondaryTextColor,
     fontSize: Dimensions.smallestTextSize*0.9,
    fontWeight: FontWeight.w500,
  );

  
}
