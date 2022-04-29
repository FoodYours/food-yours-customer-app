import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/orders/screen/order_summary_screen.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrdersTabController extends GetxController {
  void loadOOrders() async {
    // isLoading.value = true;

    // LoginModel loginModel = await setLoginInformation();

    // AppResponse response = await service.login(loginModel.toJSON());

    // isLoading.value = false;

    // showFYSnackBar(
    //     message: response.message, responseGrades: response.responseGrades);

    // if (response.responseGrades == ResponseGrades.ERROR) return;

    // preferenceRepository.setStringPref(
    //     Strings.stageOfUsage, StageOfUsage.REGISTERED.toString());

    // token = response.data!;

    // gotoDashboardScreen();
  }

  gotoOrderSummaryScreen(CartModel cartItem) =>
      Get.to(() => OrderSummaryScreen(), arguments: {"order": cartItem});
}
