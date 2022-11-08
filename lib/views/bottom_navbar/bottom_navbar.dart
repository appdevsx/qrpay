import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qrpay/widgets/button_widget/back_button_widget.dart';
import '../../controller/bottom_navbar_controller/bottom_navbar_controller.dart';
import '../../controller/dashboard_controller/dashboard_controller.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/bottom_navbar_widget/bottom_navbar_widget.dart';
import '../../widgets/drawer_widget/custom_drawer_widget.dart';


final controller=Get.put(DashBordController());
class BottomNavBarScreen extends StatelessWidget {
  final bottomNavBarController =
      Get.put(BottomNavBarController(), permanent: false);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  BottomNavBarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        drawer: const CustomDrawer(),
        key: scaffoldKey,
        // appBar:AppBar(bottom: ),
        // extendBody: true,
        backgroundColor: Colors.white,
        bottomNavigationBar:
            buildBottomNavigationMenu(context, bottomNavBarController),
        floatingActionButton: _midButtonWidget(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: bottomNavBarController
            .page[bottomNavBarController.selectedIndex.value],
      ),
    );
  }

  _midButtonWidget(BuildContext context) {
    return CircleAvatar(
      radius: 45,
      backgroundColor: CustomColor.whiteColor,
      child: CircleAvatar(
          radius: 40,
          backgroundColor: CustomColor.primaryColor.withOpacity(0.4),
          child: CircleAvatar(
            radius: 36,
            backgroundColor: CustomColor.primaryColor,
            child: InkWell(
              onTap: () {
                controller.onPresedQRScan();
              },
              child: SvgPicture.asset(
                Assets.scanqr,
                color: Colors.white,
              ),
            ),
          )),
    );
  }

  appbarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: bottomNavBarController.selectedIndex.value == 0
          ? CustomColor.transparentColor
          : CustomColor.whiteColor,
      elevation: bottomNavBarController.selectedIndex.value == 0 ? 3 : 0,
      centerTitle:
          bottomNavBarController.selectedIndex.value == 0 ? true : false,
      leading: bottomNavBarController.selectedIndex.value == 0
          ? InkWell(
              onTap: () {
                bottomNavBarController.onPressedMenuIcon();
              },
              child: Padding(
                padding: EdgeInsets.all(Dimensions.defaultPaddingSize * 0.65),
                child: InkWell(
                    onTap: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    child: SvgPicture.asset(
                      Assets.menu,
                      height: Dimensions.heightSize,
                    )),
              ),
            )
          : const BackButtonWidget(),
      title: bottomNavBarController.selectedIndex.value == 0
          ? Padding(
              padding: EdgeInsets.all(Dimensions.defaultPaddingSize * 1.2),
              child: const Text(
                Strings.qrpay,
              ))
          : Text(
              Strings.notification,
              style: CustomStyle.forgotTitleTextStyle,
            ),
      actions: [
        bottomNavBarController.selectedIndex.value == 0
            ? InkWell(
                onTap: () {
                  bottomNavBarController.onPressedNotification();
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(right: Dimensions.defaultPaddingSize),
                  child: SvgPicture.asset(Assets.notification),
                ),
              )
            : Container(),
      ],
    );
  }
}
