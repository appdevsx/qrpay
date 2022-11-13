import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/strings.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/drawer_utils.dart';
import '../../utils/size.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.35,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius * 2),
        )),
        backgroundColor: CustomColor.whiteColor,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.drawerMenu), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              _userImgWidget(context),
              _userTextwidget(context),
              _drawerWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  _userImgWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.defaultPaddingSize * 3,
        bottom: Dimensions.defaultPaddingSize * 0.8,
      ),
      height: Dimensions.heightSize * 8.4,
      width: Dimensions.widthSize * 10.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius),
        color: CustomColor.draweBackGround,
        border: Border.all(color: CustomColor.whiteColor, width: 5),
      ),
      child: Image.asset(
        Assets.profile,
        fit: BoxFit.cover,
      ),
    );
  }

  _userTextwidget(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.colnelArichart,
          style: CustomStyle.recipientInformationTexStyle,
        ),
        Text(
          Strings.colnelGmail,
          style: GoogleFonts.inter(
            fontSize: Dimensions.mediumTextSize,
            fontWeight: FontWeight.w500,
            color: CustomColor.whiteColor,
          ),
        ),
      ],
    );
  }

  _drawerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      mainAxisAlignment: mainCenter,
      children: [
        ...DrawerUtils.items.map((item) {
          return _drawerTileWidget(
            item['icon'],
            item['title'],
            onTap: () => Get.toNamed(
              '${item['route']}',
            ),
          );
        }),
      ],
    );
  }

  _drawerTileWidget(icon, title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 1.1,
          vertical: Dimensions.defaultPaddingSize * 0.5,
        ),
        child: Row(
          crossAxisAlignment: crossStart,
          mainAxisAlignment: mainStart,
          children: [
            Container(
              alignment: Alignment.center,
              height: Dimensions.heightSize * 2.5,
              width: Dimensions.widthSize * 3.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
                color: CustomColor.whiteColor.withOpacity(0.2),
              ),
              child: SvgPicture.asset(
                icon,
                color: CustomColor.whiteColor,
              ),
            ),
            addHorizontalSpace(Dimensions.widthSize),
            Padding(
              padding:
                  EdgeInsets.only(top: Dimensions.defaultPaddingSize * 0.2),
              child: Text(
                title,
                style: CustomStyle.whiteColorTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
