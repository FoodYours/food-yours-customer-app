import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/user/phone_number_verification/screen/phone_number_verification_screen.dart';
import 'package:food_yours_customer/util/phone_util.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class ChangePhoneNumberController extends GetxController {
  final TextEditingController phoneTextCtrl = TextEditingController();
  final TextEditingController passwordTextCtrl = TextEditingController();

  RxString phoneError = "".obs;
  RxString passwordError = "".obs;

  void clearPhoneError(String value) => phoneError.value = "";
  void clearPasswordError(String value) => passwordError.value = "";

  validateInput() async {
    if (GetUtils.isBlank(phoneTextCtrl.text)! &&
        await isPhoneNumberValid(phoneTextCtrl.text, "NG") == false) {
      phoneError.value = Strings.validPhoneNumberErrorMessage;
    } else if (GetUtils.isBlank(passwordTextCtrl.text)!) {
      passwordError.value = Strings.blankFieldErrorMessage;
    } else if (GetUtils.isLengthLessThan(passwordTextCtrl.text, Integers.k8)) {
      passwordError.value = Strings.lessThanEightCharErrorMessage;
    } else if (GetUtils.isAlphabetOnly(passwordTextCtrl.text) ||
        GetUtils.isNumericOnly(passwordTextCtrl.text)) {
      passwordError.value = Strings.isNotAlphaNumericErrorMessage;
    } else {
      gotoVerifyPhoneNumberScreen();
    }
  }

  void gotoVerifyPhoneNumberScreen() async =>
      Get.to(() => PhoneNumberVerificationScreen(), arguments: {
        "phoneNumber": await normalizePhoneNumber(phoneTextCtrl.text, "NG"),
        "password": passwordTextCtrl.text,
      })?.then((value) {
        if (value is Map && value.containsKey("phoneNumber")) {
          Get.back(result: value);
        }
      });
}
