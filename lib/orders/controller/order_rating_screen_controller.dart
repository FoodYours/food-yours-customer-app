import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/chef_screen/service/chef_service.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/dashboard/screen/dashboard_screen.dart';
import 'package:food_yours_customer/orders/view_model/chef_rating_model.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class OrderRatingScreenController extends GetxController {
  final ChefService chefService = Get.find();

  CartModel cartItem = CartModel();

  RxBool isLoading = false.obs;
  RxString loadingMessage = "".obs;

  RxInt rating = (-1).obs;
  String vendorId = "";
  RxString remarkError = "".obs;

  TextEditingController remarkTextCtrl = TextEditingController();

  gotoDashBoardScreen() => Get.to(() => DashboardScreen());

  void clearRemarkError(_) => remarkError.value = "";

  validateInput() async {
    if (GetUtils.isBlank(remarkTextCtrl.text)!) {
      remarkError.value = Strings.blankFieldErrorMessage;
    } else if (rating.value == -1) {
      showFYSnackBar(message: "Please rate chef before proceeding");
    } else {
      rateChef();
    }
  }

  void rateChef() async {
    isLoading.value = true;

    loadingMessage.value = "Saving Review";

    ChefReviewModel chefReviewInformation = setReviewInformation();

    AppResponse response =
        await chefService.rateChef(chefReviewInformation.toJSON());

    isLoading.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    return gotoNextScreen();
  }

  ChefReviewModel setReviewInformation() {
    return ChefReviewModel(
      remark: remarkTextCtrl.text,
      starRated: rating.value.toString(),
      vendorId: cartItem.chefId,
    );
  }

  @override
  void onReady() {
    initGetArgument();
    super.onReady();
  }

  void gotoNextScreen() => Get.offAll(() => DashboardScreen());

  void initGetArgument() {
    cartItem = Get.arguments["order"];
  }

  onRatingSelected(int value) {
    rating.value = value;
  }
}
