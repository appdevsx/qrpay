import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_phone_code_picker/country_phone_code_picker.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/size.dart';

class CountryPhoneWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final int maxLines;
  final Icon? prefixIcon;
  final TextEditingController controller;
  const CountryPhoneWidget({
    Key? key,
    required this.controller,
    this.maxLines = 1,
    this.prefixIcon,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  State<CountryPhoneWidget> createState() => _PrimaryInputWidgetState();
}

class _PrimaryInputWidgetState extends State<CountryPhoneWidget> {
  FocusNode? focusNode;
  bool isVisibility = true;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 52,
          margin: EdgeInsets.only(top: Dimensions.marginSize * 0.6),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            controller: widget.controller,
            focusNode: focusNode,
            textAlign: TextAlign.left,
            style: CustomStyle.inputTextStyle,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: widget.labelText,
                hintText: widget.hintText,
                labelStyle: GoogleFonts.inter(
                  color: focusNode!.hasFocus
                      ? CustomColor.primaryColor
                      : CustomColor.secondaryTextColor,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.w500,
                ),
                hintStyle: GoogleFonts.inter(
                  color: focusNode!.hasFocus
                      ? CustomColor.primaryColor.withOpacity(0.6)
                      : CustomColor.borderColor,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.w600,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.7),
                    borderSide: BorderSide(
                      color: focusNode!.hasFocus
                          ? CustomColor.primaryColor
                          : CustomColor.secondaryTextColor,
                      width: 2,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.7),
                    borderSide: const BorderSide(
                      color: CustomColor.primaryColor,
                      width: 2,
                    )),
                disabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.7),
                    borderSide: const BorderSide(
                      color: CustomColor.primaryColor,
                      width: 2,
                    )),
                contentPadding: EdgeInsets.only(
                  left: Dimensions.widthSize * 1,
                  top: Dimensions.heightSize * 0.4,
                  bottom: Dimensions.heightSize * 0.4,
                ),
                prefixIcon: SizedBox(
                  width: Dimensions.widthSize * 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CountryPhoneCodePicker(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          flagHeight: 20,
                          flagWidth: 20,
                          style: const TextStyle(fontSize: 16),
                          searchBarHintText: 'Search by name',
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          style: CustomStyle.inputTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: CustomColor.primaryColor,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              hintText: "   +1",
                              hintStyle: CustomStyle.inputTextStyle),
                        ),
                      ),
                      const Text(
                        '|',
                        style: TextStyle(color: CustomColor.primaryColor),
                      ),
                      addHorizontalSpace(Dimensions.widthSize * 0.2),
                    ],
                  ),
                )),
          ),
        )
      ],
    );
  }
}
