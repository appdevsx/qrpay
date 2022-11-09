
import 'package:flutter/material.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

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
        child: Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.only(top: Dimensions.heightSize * 3),
              child: ListView(
                children: const [
                 Text("Dfs")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}