import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/user/phone_number_verification/model/code_verification_model.dart';
import 'package:food_yours_customer/user/phone_number_verification/model/request_verification_code_model.dart';
import 'package:food_yours_customer/user/service/user_service.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class OtpVerificationController extends GetxController {
  final UserService userService = Get.find();

  RxString phoneNumber = "".obs;
  RxString password = "".obs;
  RxString loadingMessage = "".obs;

  RxBool isLoading = false.obs;

  final TextEditingController otpTextController = TextEditingController();

  @override
  void onReady() {
    phoneNumber.value = Get.arguments["phoneNumber"];
    password.value = Get.arguments["password"];
    super.onReady();
  }

  verifyCode() async {
    isLoading.value = true;

    loadingMessage.value = "Verifying Code";

    final CodeVerificationModel codeVerificationModel =
        setCodeVerificationModel();

    AppResponse response =
        await userService.verifyCode(codeVerificationModel.toJSON());

    isLoading.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    // if (response.responseGrades == ResponseGrades.ERROR) return;

    showAlertDialog(
      isSuccess: true,
      title: "Phone Verified Successfully",
      message:
          "Congratulations! You have now verified your phone\nnumber, you can now start ordering.",
      notificationIcon: Images.alert_success_check,
    ).then((value) => Get.back(result: {
          "phoneNumber": phoneNumber.value,
        }));
  }

  requestVerificationCode() async {
    isLoading.value = true;

    loadingMessage.value = "Requesting Verification Code";

    final RequestVerificationCodeModel requestVerificationCodeModel =
        setRequestVerificationCodeModel();

    AppResponse response = await userService
        .requestVerificationCode(requestVerificationCodeModel.toJSON());

    isLoading.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    // gotoOTPVerificationScreen();
  }

  CodeVerificationModel setCodeVerificationModel() {
    return CodeVerificationModel(
      phoneNumber: phoneNumber.value,
      otp: otpTextController.text,
    );
  }

  RequestVerificationCodeModel setRequestVerificationCodeModel() {
    return RequestVerificationCodeModel(
      phoneNumber: phoneNumber.value,
      idToken: token,
    );
  }
}
