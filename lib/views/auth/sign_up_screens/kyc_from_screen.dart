import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/assets.dart';
import 'package:qrpay/utils/custom_color.dart';
import 'package:qrpay/utils/custom_style.dart';
import 'package:qrpay/utils/dimensions.dart';
import 'package:qrpay/utils/size.dart';
import 'package:qrpay/utils/strings.dart';
import 'package:qrpay/widgets/button_widget/primary_button.dart';
import 'package:qrpay/widgets/input_widget/country_picker.dart';
import 'package:qrpay/widgets/input_widget/phone_number_input.dart';
import 'package:qrpay/widgets/input_widget/primary_input_widget.dart';
import 'package:qrpay/widgets/others/custom_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../controller/auth/sign_up_controllers/kyc_from_controller.dart';
import '../../../widgets/button_widget/custom_text_button.dart';

class KYCFromScreen extends StatelessWidget {
  KYCFromScreen({super.key});
  final controller = Get.put(KYCFromController());
  final signUpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.kYCForm),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.6),
      physics: const BouncingScrollPhysics(),
      children: [
        _inputWidget(context),
        _uploadImageWidget(context),
        _passwordTextInputWIdget(context),
        _buttonWidget(context),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.firstNameController,
                  hintText: Strings.enterName,
                  labelText: Strings.firstName,
                ),
              ),
              addHorizontalSpace(Dimensions.widthSize * 2),
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.lasstNameController,
                  hintText: Strings.enterName,
                  labelText: Strings.lastName,
                ),
              ),
            ],
          ),
          addVerticalSpace(
            Dimensions.heightSize,
          ),

          //email address input
          PrimaryInputWidget(
            controller: controller.emailAddressController,
            hintText: Strings.enterEmailAddress,
            labelText: Strings.emailAddress,
          ),
          addVerticalSpace(
            Dimensions.heightSize * 1.5,
          ),
          //number,city zip code
          SignUpCountryCodePickerWidget(
            hintText: Strings.selectCountry,
            controller: controller.selectCountryController,
          ),

          addVerticalSpace(
            Dimensions.heightSize,
          ),
          Row(
            children: [
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.selectCityController,
                  hintText: Strings.selectCity,
                  labelText: Strings.selectCity,
                ),
              ),
              addHorizontalSpace(Dimensions.widthSize * 2),
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.selectZipController,
                  hintText: Strings.enterCode,
                  labelText: Strings.zipCode,
                ),
              ),
            ],
          ),
          addVerticalSpace(
            Dimensions.heightSize * 1.5,
          ),
          //phone number code
          PhoneNumberWithCountryCodeInput(
            controller: controller.phoneNumberController,
            hintText: Strings.phoneNumber,
          ),
          addVerticalSpace(Dimensions.heightSize * 1.5)
        ],
      ),
    );
  }

  _uploadImageWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: mainCenter,
      children: [
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Expanded(
              child: DottedBorder(
                dashPattern: const [6, 4],
                strokeWidth: 2,
                color: CustomColor.borderColor,
                child: SizedBox(
                  height: Dimensions.heightSize * 8.3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: mainCenter,
                      children: [
                        SvgPicture.asset(Assets.frontpart),
                        addVerticalSpace(
                          Dimensions.heightSize * 0.7,
                        ),
                        Text(
                          Strings.frontPart,
                          style: CustomStyle.borderColorText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            addHorizontalSpace(
              Dimensions.widthSize,
            ),
            Expanded(
              child: DottedBorder(
                color: CustomColor.borderColor,
                dashPattern: const [8, 4],
                strokeWidth: 2,
                child: SizedBox(
                  height: Dimensions.heightSize * 8.3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: mainCenter,
                      crossAxisAlignment: crossCenter,
                      children: [
                        SvgPicture.asset(Assets.backpart),
                        addVerticalSpace(
                          Dimensions.heightSize * 0.7,
                        ),
                        Text(
                          Strings.backPart,
                          style: CustomStyle.borderColorText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        addVerticalSpace(
          Dimensions.heightSize * 0.5,
        ),
        Text(
          Strings.uploadPassportNidDri,
          style: CustomStyle.smallestTExtStyle,
        ),
        addVerticalSpace(Dimensions.heightSize)
      ],
    );
  }

  _passwordTextInputWIdget(BuildContext context) {
    return Column(
      children: [
        PrimaryInputWidget(
          controller: controller.passwordController,
          hintText: Strings.enterPassword,
          labelText: Strings.password,
        ),
        addVerticalSpace(Dimensions.heightSize),
        PrimaryInputWidget(
          controller: controller.confirmPasswordController,
          hintText: Strings.enterConfirmPassword,
          labelText: Strings.confirmPassword,
        ),
        RichText(
          text: TextSpan(
            text: Strings.byUsing,
            style: GoogleFonts.inter(
              fontSize: Dimensions.smallTextSize,
              color: CustomColor.primaryTextColor,
              fontWeight: FontWeight.w600,
            ),
            children: [
              WidgetSpan(
                child: CustomTextButton(
                  onPressed: () {
                    controller.onPressedPrivacy();
                  },
                  text: Strings.privacyPolicy,
                ),
              ),
              TextSpan(
                text: " &",
                style: GoogleFonts.inter(
                  fontSize: Dimensions.smallTextSize,
                  color: CustomColor.primaryTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              WidgetSpan(
                child: CustomTextButton(
                  onPressed: () {
                    controller.onPressedUserAgriment();
                  },
                  text: Strings.userAgreement,
                ),
              ),
            ],
          ),
        ),
        addVerticalSpace(Dimensions.heightSize*1.5),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.heightSize,
      ),
      child: PrimaryButtonWidget(
        text: Strings.continues,
        onPressed: () {
          controller.onPresedcontinue();
        },
      ),
    );
  }
}
