import 'package:food_yours_customer/auth/registration/screen/registration_screen.dart';
import 'package:food_yours_customer/util/url_launcher_util.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class ForgetPasswordConfirmationScreenController extends GetxController {
  RxString email = "".obs;

  @override
  void onReady() {
    setGetxArgument();
    super.onReady();
  }

  gotoRegistrationScreen() => Get.to(() => RegistrationScreen());

  void openEmailApp() {
    String url = Uri(scheme: 'mailto').toString();
    launchUrl(url);
  }

  void setGetxArgument() {
    email.value = Get.arguments["email"];
  }
}
