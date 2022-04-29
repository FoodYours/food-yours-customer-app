import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/orders/screen/qr_code_screen.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderTrackingScreenController extends GetxController {
  CartModel cartItem = CartModel();

  @override
  void onReady() {
    initGetArgument();
    super.onReady();
  }

  void gotoQrCodeScreen() => Get.to(() => QRCodeScreen(), arguments: {
        "order": Get.arguments["order"],
      });

  void initGetArgument() {
    cartItem = Get.arguments;
  }
}
