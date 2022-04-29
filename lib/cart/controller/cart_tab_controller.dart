import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/cart/interface/interface_cart_order.dart';
import 'package:food_yours_customer/common/model/basic_request_model.dart';
import 'package:food_yours_customer/cart/view_model/cart_items_view_model.dart';
import 'package:food_yours_customer/cart/screen/cart_order_summary_screen.dart';
import 'package:food_yours_customer/cart/service/cart_service/cart_service.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/dashboard/controller/dashboard_screen_controller.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class CartTabController extends GetxController implements ICartOrder {
  final CartService cartService = Get.find();

  final DashBoardScreenController dashBoardScreenController = Get.find();

  final RxBool isLoading = false.obs;

  final RxString loadingMessage = "".obs;

  final RxList<CartItemsViewModel> cartItems = <CartItemsViewModel>[].obs;

  @override
  void onReady() async {
    dashBoardScreenController.tabController
      ..addListener(() {
        if (dashBoardScreenController.tabController.index == 2) {
          fetchCartItems();
        }
      });
    super.onReady();
  }

  void fetchCartItems() async {
    dashBoardScreenController.isLoading.value = true;

    dashBoardScreenController.loadingMessage.value = "Loading cart items...";

    BasicRequestModel fetchCartItemsModel = await BasicRequestModel();

    AppResponse response = await cartService.fetchCartItems(
      fetchCartItemsModel.toJSON(),
    );

    dashBoardScreenController.isLoading.value = false;

    showFYSnackBar(
      message: response.message,
      responseGrades: response.responseGrades,
    );

    if (response.responseGrades == ResponseGrades.ERROR) return;

    cartItems.assignAll(response.data);
  }

  gotoCartOrderSummaryScreen() => Get.to(() => CartOrderSummaryScreen());

  @override
  placeOrder() {}
}
