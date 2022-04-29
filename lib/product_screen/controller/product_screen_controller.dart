// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/cart/model/online_cart_model.dart';
import 'package:food_yours_customer/cart/screen/cart_order_summary_screen.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/product_screen/service/product_service.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/date_time_util.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:hive/hive.dart';

class ProductScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ProductService productService = Get.find();

  Rx<MealViewModel> meal = MealViewModel().obs;
  Rx<FYOptionItem> selectedQuantity = FYOptionItem().obs;

  RxSet<FYOptionItem> selectedExtras = RxSet<FYOptionItem>();
  RxSet<FYOptionItem> selectedSupplements = RxSet<FYOptionItem>();
  RxMap<CartModel, CartModel> cartItems = RxMap<CartModel, CartModel>();

  TextEditingController noteTextController = TextEditingController();

  late AnimationController animationCtrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0.47,
      upperBound: 1.0);

  late Animation<double> animation =
      CurvedAnimation(parent: animationCtrl, curve: Curves.easeInOutCirc);

  List deliveryDays = [];
  String chefId = "";
  String chefImageUrl = "";
  RxInt cartItemsCount = 0.obs;

  RxBool isLoading = false.obs;
  RxString loadingMessage = "".obs;

  onSupplementSelected(value) {
    bool hasElement = selectedSupplements.contains(value as FYOptionItem);
    if (hasElement) {
      return selectedSupplements.remove(value);
    }
    selectedSupplements.add(value);
  }

  @override
  void onReady() {
    setGetxArguments();
    initHiveData();
    super.onReady();
  }

  void setGetxArguments() {
    meal.value = Get.arguments["meal"];
    deliveryDays = Get.arguments["chefDeliveryDays"];
    chefId = Get.arguments["chefId"];
    chefImageUrl = Get.arguments["chefImageUrl"];
  }

  onExtrasSelected(value) {
    bool hasElement = selectedExtras.contains(value as FYOptionItem);
    if (hasElement) {
      return selectedExtras.remove(value);
    }
    selectedExtras.add(value);
  }

  onQuantitySelected(value) {
    selectedQuantity.value = value as FYOptionItem;
  }

  void gotoOrderSummary() {
    Get.off(() => CartOrderSummaryScreen());
  }

  validateInput() {
    if (GetUtils.isBlank(selectedQuantity.value.name) == true) {
      return showFYSnackBar(
        message: "Please select a quantity",
        responseGrades: ResponseGrades.ERROR,
      );
    }
    addToCart();
  }

  void addToCart() async {
    CartModel cartModel = setRequestInformation();

    // CartModel? cartItem = Hive.box(Strings.CART_BOX).get(cartModel.id);

    await addToOfflineCart(cartModel);

    // if (cartItem != null) {
    //   cartItem.count += 1;
    //   await addToOnlineCart(cartItem);
    // } else {
    //   await addToOnlineCart(cartModel);
    // }
  }

  incrementCartItems() async {
    cartItemsCount.value += 1;

    await Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount.value);
  }

  CartModel setRequestInformation() {
    return CartModel(
      key: 0,
      mealName: meal.value.name,
      note: noteTextController.text,
      quantity: {
        "name": selectedQuantity.value.name,
        "price": selectedQuantity.value.value
      },
      extras: listOptionsToListMap(selectedExtras.value.toList()),
      supplements: listOptionsToListMap(selectedSupplements.value.toList()),
      total: calculateTotalCostOfOrder(selectedSupplements.value.toList(),
          selectedExtras.value.toList(), selectedQuantity.value),
      count: 1,
      minimumMealPrice: double.parse(meal.value.allPrices[0].value),
      chefName: meal.value.chefName,
      address: user.value.address,
      chefDeliveryDays: deliveryDays,
      specifiedDeliveryAndTime:
          DateTimeUtil.dateTimeToString(DateTime.now().add(Duration(hours: 2))),
      chefId: chefId,
      chefImageUrl: chefImageUrl,
    );
  }

  List<Map> listOptionsToListMap(List<FYOptionItem> options) {
    return options
        .map((e) => {
              "name": e.name,
              "price": e.value,
            })
        .toList();
  }

  double calculateTotalCostOfOrder(List<FYOptionItem> suppliments,
      List<FYOptionItem> extras, FYOptionItem quantity) {
    return <FYOptionItem>[...suppliments, ...extras, quantity].fold(
        0.0,
        (double previousValue, element) =>
            (previousValue + double.parse(element.value)));
  }

  void initHiveData() async {
    cartItemsCount.value = await Hive.box(Strings.RANDOM_INFORMATION_BOX)
            .get(Strings.CART_ITEMS_COUNT) ??
        0;

    print(await Hive.box(Strings.CART_BOX).values);
  }

  Future<void> addToOnlineCart(CartModel cartItem) async {
    isLoading.value = true;

    loadingMessage.value = "Adding item to cart";

    OnlineCartModel onlineCartModel = await setOnlineCartInformation(cartItem);

    AppResponse response =
        await productService.addToOnlineCart(onlineCartModel.toJSON());

    isLoading.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    addToLocalCart(cartItem);

    incrementCartItems();
  }

  OnlineCartModel setOnlineCartInformation(CartModel cartItem) {
    return OnlineCartModel(
      idToken: token,
      foodId: cartItem.id,
      quantity: cartItem.count.toString(),
      mealAmount: cartItem.minimumMealPrice.toString(),
      extras: Map.fromIterable(cartItem.extras,
          key: (v) => v["name"], value: (v) => v["price"]),
      supplements: Map.fromIterable(cartItem.supplements,
          key: (v) => v["name"], value: (v) => v["price"]),
      notes: cartItem.note,
      deliveryDay: cartItem.specifiedDeliveryAndTime,
      total: cartItem.total.toString(),
    );
  }

  addToLocalCart(CartModel cartItem) async {
    await Hive.box(Strings.CART_BOX).put(cartItem.id, cartItem);
  }

  addToOfflineCart(CartModel cartItem) async {
    bool itContainsKey = cartItems.containsValue(cartItem);
    if (/* cartItems.containsKey(cartItem) */ itContainsKey) {
      CartModel existingCartItem = cartItems[cartItem]!;

      cartItem.count = existingCartItem.count + 1;
      cartItem.key = existingCartItem.key;

      await Hive.box(Strings.CART_BOX).delete(cartItem.key);
    }

    int key = await Hive.box(Strings.CART_BOX).add(cartItem);

    // print(await Hive.box(Strings.CART_BOX).values);

    cartItem.key = key;

    cartItems.update(
      cartItem,
      (_) => cartItem,
      ifAbsent: () => cartItem,
    );
  }
}
