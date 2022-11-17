import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class CustomDropDown extends StatelessWidget {
  final RxString selectMethod;
  final List<String> itemsList;
  const CustomDropDown({
    required this.itemsList,
    Key? key,
    required this.selectMethod,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      hint: Text(
        selectMethod.value,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: CustomColor.borderColor,
        ),
      ),
      iconOnClick: const Icon(
        Icons.arrow_drop_up,
        color: CustomColor.secondaryTextColor,
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: CustomColor.secondaryTextColor,
      ),
      isExpanded: true,
      buttonWidth: MediaQuery.of(context).size.width,
      buttonPadding: EdgeInsets.only(
        left: Dimensions.defaultPaddingSize * 0.5,
        right: Dimensions.defaultPaddingSize * 0.5,
      ),
      itemHeight: 50,
      dropdownWidth: 180,
      underline: Container(),
      offset: const Offset(-1, -2),
      items: itemsList.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value.toString(),
          child: Container(
            padding: const EdgeInsets.only(left: 25),
            alignment: Alignment.centerLeft,
            height: 35,
            // ignore: unrelated_type_equality_checks
            color: selectMethod == value
                ? CustomColor.primaryColor.withOpacity(0.5)
                : Colors.transparent,
            child: Text(
              value.toString(),
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CustomColor.primaryColor,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (String? value) {
        selectMethod.value = value!;
      },
    );
  }
}
