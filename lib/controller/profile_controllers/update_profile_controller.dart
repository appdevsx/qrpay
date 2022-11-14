import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/strings.dart';

class UpdateProfileController extends GetxController{
  final firstNameController = TextEditingController();
  final lasstNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final selectCountryController = TextEditingController();
  final selectCityController = TextEditingController();
  final selectZipController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lasstNameController.dispose();
    emailAddressController.dispose();
    selectCountryController.dispose();
    selectCityController.dispose();
    selectZipController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
  RxString selectCityMethod = Strings.selectCity.obs;
  List<String> selectCityList = ["Kabul", "Herat"];
  File? image;
  final picker = ImagePicker();
  Future chooseFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {}
    update();
  }

  Future chooseFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {}
    update();
  }

  void onTapUpdateProfile() {}


}