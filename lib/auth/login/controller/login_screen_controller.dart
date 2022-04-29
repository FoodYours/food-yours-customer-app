import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/auth/forgot_password/screen/forgot_password.dart';
import 'package:food_yours_customer/auth/login/model/login_model.dart';
import 'package:food_yours_customer/auth/registration/screen/registration_screen.dart';
import 'package:food_yours_customer/auth/service/auth_service.dart';
import 'package:food_yours_customer/common/repository/preference_repository/preference_repository.dart';
import 'package:food_yours_customer/common/service/hive_service.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/dashboard/screen/dashboard_screen.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';

String token = "";

class LoginScreenController extends GetxController {
  final PreferenceRepository preferenceRepository = Get.find();
  final AuthService service = Get.find();

  @override
  void onReady() async {
    await HiveService.openSearchHistoryBox();
    super.onReady();
  }

  final TextEditingController emailTextCtrl = TextEditingController();
  final TextEditingController passwordTextCtrl = TextEditingController();

  RxString emailError = "".obs;
  RxString passwordError = "".obs;

  RxString loadingMessage = "authenticating ...".obs;

  clearEmailError(_) => emailError.value = "";
  clearPasswordError(_) => passwordError.value = "";

  RxBool isLoading = false.obs;
  RxBool obscurePassword = true.obs;

  toggleObscurePassword() => obscurePassword.value = !obscurePassword.value;

  validateInputs() {
    if (!GetUtils.isEmail(emailTextCtrl.text)) {
      emailError.value = Strings.validPhoneNumberErrorMessage;
    } else if (GetUtils.isBlank(passwordTextCtrl.text)!) {
      passwordError.value = Strings.blankFieldErrorMessage;
    } else {
      login();
    }
  }

  gotoRegistrationScreen() => Get.to(() => RegistrationScreen());
  gotoForgotPasswordScreen() => Get.to(() => ForgetPasswordScreen());
  gotoDashboardScreen() => Get.offUntil(
      GetPageRoute(page: () => DashboardScreen()),
      (Route<dynamic> route) => (route).isFirst /*  == LoginScreen */);

  void login() async {
    isLoading.value = true;

    LoginModel loginModel = await setLoginInformation();

    AppResponse response = await service.login(loginModel.toJSON());

    isLoading.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    preferenceRepository.setStringPref(
        Strings.stageOfUsage, StageOfUsage.REGISTERED.toString());

    token = response.data!;

    gotoDashboardScreen();
  }

  setLoginInformation() {
    return LoginModel(
      email: emailTextCtrl.text,
      password: passwordTextCtrl.text,
    );
  }
}
