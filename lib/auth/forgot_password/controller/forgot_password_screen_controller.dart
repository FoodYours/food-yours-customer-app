import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/auth/forgot_password/model/password_reset_model.dart';
import 'package:food_yours_customer/auth/forgot_password/screen/fogot_password_confirmation_screen.dart';
import 'package:food_yours_customer/auth/forgot_password/screen/new_password_screen.dart';
import 'package:food_yours_customer/auth/login/screen/login_screen.dart';
import 'package:food_yours_customer/auth/registration/screen/registration_screen.dart';
import 'package:food_yours_customer/auth/service/auth_service.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class ForgetPasswordScreenController extends GetxController {
  final AuthService authService = Get.find();

  final TextEditingController emailTextCtrl = TextEditingController();
  RxBool isLoading = false.obs;
  RxString loadingMessage = "".obs;

  RxString emailError = "".obs;
  void clearEmailError(_) => emailError.value = "";

  validateInput() async {
    if (GetUtils.isBlank(emailTextCtrl.text)!) {
      emailError.value = Strings.blankFieldErrorMessage;
    } else if (!GetUtils.isEmail(emailTextCtrl.text)) {
      emailError.value = Strings.validEmailErrorMessage;
    } else {
      initiatePasswordReset();
    }
  }

  gotoRegistrationScreen() => Get.to(() => RegistrationScreen());
  gotoNewPasswordScreen() => Get.to(() => NewPasswordScreen());

  void initiatePasswordReset() async {
    isLoading.value = true;

    loadingMessage.value = "Initiating password reset";

    PasswordResetModel passwordResetInformation = setPasswordResetInformation();

    AppResponse response = await authService
        .initiatePasswordReset(passwordResetInformation.toJSON());

    isLoading.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    return gotoNextScreen();
  }

  void gotoNextScreen() => Get.off(
        () => ForgotPasswordConfirmationScreen(),
        arguments: {
          "email": emailTextCtrl.text,
        },
      );

  PasswordResetModel setPasswordResetInformation() {
    return PasswordResetModel(email: emailTextCtrl.text);
  }
}
