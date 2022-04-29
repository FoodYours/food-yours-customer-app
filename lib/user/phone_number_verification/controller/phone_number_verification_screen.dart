import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/user/phone_number_verification/model/request_verification_code_model.dart';
import 'package:food_yours_customer/user/phone_number_verification/screen/otp_verification_screen.dart';
import 'package:food_yours_customer/user/service/user_service.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class PhoneNumberVerificationController extends GetxController {
  final UserService userService = Get.find();

  RxString phoneNumber = "".obs;
  RxString password = "".obs;
  RxString loadingMessage = "".obs;

  RxBool isLoading = false.obs;

  @override
  void onReady() {
    phoneNumber.value = Get.arguments["phoneNumber"];
    password.value = Get.arguments["password"];
    super.onReady();
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

    gotoOTPVerificationScreen();
  }

  gotoOTPVerificationScreen() {
    Get.to(() => OtpVerificationScreen(), arguments: {
      "phoneNumber": phoneNumber.value,
      "password": password.value,
    })?.then((value) {
      if (value is Map && value.containsKey("phoneNumber")) {
        Get.back(result: value);
      }
    });
  }

  RequestVerificationCodeModel setRequestVerificationCodeModel() {
    return RequestVerificationCodeModel(
      phoneNumber: phoneNumber.value,
      idToken: token,
    );
  }

  changePhoneNumber() => Get.back();
}
