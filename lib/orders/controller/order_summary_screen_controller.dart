import 'dart:async';

import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/orders/screen/order_summary_screen.dart';
import 'package:food_yours_customer/orders/screen/order_tracking_screen.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderSummaryScreenController extends GetxController {
  late Timer timer;
  final Rx<CartModel> cartItem = CartModel().obs;

  @override
  void onReady() {
    initGetArgument();
    // openAlertDialog();
    super.onReady();
  }

  gotoOrderSummaryScreen() => Get.to(() => OrderSummaryScreen());

  gotoOrderTrackingScreen() => Get.to(() => OrderTrackingScreen(), arguments: {
        "order": Get.arguments["order"],
      });

  openAlertDialog() {
    // timer = Timer(
    //     Duration(seconds: Integers.dashBoardTabLength),
    //     () => showAlertDialog(
    //         Images.alert_success_check,
    //         "You received your order!",
    //         "Congratulations! You received your orders successfully, enjoy your meal. You can rate a chef based on your experience with your order in the “my orders” page, tap the order to continue.",
    //         "",
    //         true));
  }

  gotoChefReviewScreen() {}

  void initGetArgument() {
    cartItem.value = Get.arguments["order"];
  }
}
