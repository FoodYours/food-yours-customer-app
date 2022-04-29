import 'dart:async';

import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SpecialOrderScreenController extends GetxController {
  late Timer timer;

  @override
  void onReady() {
    openAlertDialog();
    super.onReady();
  }

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
}
