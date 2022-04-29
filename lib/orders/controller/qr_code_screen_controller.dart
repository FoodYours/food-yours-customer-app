import 'package:food_yours_customer/orders/screen/order_rating_screen.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class QRCodeScreenController extends GetxController {
  // CartModel cartItem = CartModel();

  gotoChefRatingScreen() => Get.to(() => OrderRatingScreen(), arguments: {
        "order": Get.arguments["order"],
      });

  // @override
  // void onReady() {
  //   initGetArgument();
  //   super.onReady();
  // }

  // void initGetArgument() {
  //   cartItem = Get.arguments["order"];
  // }
}
