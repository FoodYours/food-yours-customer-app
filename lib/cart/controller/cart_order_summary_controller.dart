import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/cart/interface/interface_cart_order.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/cart/service/cart_service/cart_service.dart';
import 'package:food_yours_customer/cart/view_model/address_view_model.dart';
import 'package:food_yours_customer/common/model/basic_request_model.dart';
import 'package:food_yours_customer/common/model/delivery_day.dart';
import 'package:food_yours_customer/cart/screen/delivery_time_screen.dart';
import 'package:food_yours_customer/cart/screen/payment_method_screen.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/user/all_address/screen/all_address_screen.dart';
import 'package:food_yours_customer/user/new_address/screen/new_address_screen.dart';
import 'package:food_yours_customer/user/phone_number_verification/screen/change_phone_number.dart';
import 'package:food_yours_customer/util/date_time_util.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

class CartOrderSummaryScreenController extends GetxController
    implements ICartOrder {
  final CartService cartService = Get.find();

  RxDouble subtotal = 0.0.obs;

  RxDouble total = 0.0.obs;

  RxBool isLoading = false.obs;

  RxString loadingMessage = "".obs;

  RxString addressError = "".obs;

  CartModel selectedCartItem = CartModel();

  RxString addressText = "".obs;

  RxString deliveryRecipientNumber = "".obs;

  RxString deliveryDateString = "".obs;

  AddressViewModel addressViewModel = AddressViewModel();

  RxInt selectedCartItemIndex = (-1).obs;

  @override
  void onReady() {
    initGetxArguments();
    loadAddresses();
    getSubTotal();
    getTotal();
    super.onReady();
  }

  void initGetxArguments() {
    setDeliveryTime();
    setPhoneNumber();
  }

  loadAddresses() async {
    isLoading.value = true;

    loadingMessage.value = "Load Delivery Addresses";

    BasicRequestModel basicRequestModel = BasicRequestModel();

    AppResponse response =
        await cartService.loadAddresses(basicRequestModel.toJSON());

    isLoading.value = false;

    showFYSnackBar(
        message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    addressViewModel = response.data;

    addressText.value = getAvailableAddress();
  }

  String getAvailableAddress() {
    if (addressViewModel.address.isNotEmpty) {
      return addressViewModel.address;
    } else if (addressViewModel.workAddress.isNotEmpty) {
      return addressViewModel.workAddress;
    } else {
      return addressViewModel.otherAddress;
    }
  }

  @override
  placeOrder() {
    /* if (deliveryDateString.value.isEmpty) {
      return showFYSnackBar(
          message: "No delivery for today please your specify delivery date");
    } else */
    if (subtotal.value == 0) {
      return showFYSnackBar(message: "No items in cart.");
    } else if (deliveryRecipientNumber.value.isEmpty) {
      return gotoChangePhoneNumberScreen();
    } else {
      gotoPaymentMethodScreen();
    }
  }

  increaseItemQuantity(String cartItemId) {
    CartModel cartItem = Hive.box(Strings.CART_BOX).get(cartItemId);

    Hive.box(Strings.CART_BOX).put(cartItemId, cartItem..count += 1);

    int cartItemsCount =
        Hive.box(Strings.RANDOM_INFORMATION_BOX).get(Strings.CART_ITEMS_COUNT);

    Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount += 1);

    getSubTotal();
    getTotal();
  }

  decreaseItemQuantity(String cartItemId) {
    CartModel cartItem = Hive.box(Strings.CART_BOX).get(cartItemId);

    Hive.box(Strings.CART_BOX).put(cartItemId, cartItem..count -= 1);

    int cartItemsCount =
        Hive.box(Strings.RANDOM_INFORMATION_BOX).get(Strings.CART_ITEMS_COUNT);

    Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount -= 1);

    getSubTotal();
    getTotal();

    if (cartItem.count == 0) {
      Hive.box(Strings.CART_BOX).delete(cartItemId);
      Hive.box(Strings.CART_BOX).compact();
      return;
    }
  }

  getSubTotal() {
    subtotal.value = Hive.box(Strings.CART_BOX).values.fold(
        0.0,
        (double previousValue, element) =>
            previousValue += ((element as CartModel).total * element.count));
  }

  getTotal() {
    total.value = subtotal.value + 1000;
  }

  gotoAddressManagementScreen() {
    if (addressViewModel.address.isEmpty &&
        addressViewModel.workAddress.isEmpty &&
        addressViewModel.otherAddress.isEmpty) {
      gotoNewAddressScreen();
    } else {
      gotoAllAddressesScreen();
    }
  }

  void gotoNewAddressScreen() => Get.to(() => NewAddressScreen());

  void gotoChangePhoneNumberScreen() =>
      Get.to(() => ChangePhoneNumberScreen())?.then((value) {
        deliveryRecipientNumber.value = value["phoneNumber"];
      });

  void gotoAllAddressesScreen() {
    Get.to(() => AllAddressesScreen(), arguments: {
      "addresses": addressViewModel,
    })?.then((value) {
      if (value != null) addressText.value = value;
    });
  }

  void gotoPaymentMethodScreen() {
    Get.to(() => PaymentMethodScreen(), arguments: {
      "total": total.value,
      "deliveryDate": deliveryDateString.value,
    });
  }

  validateAddressChange() => pop();

  onCartItemSelected(CartModel value, int selectedIndex) {
    selectedCartItem.chefDeliveryDays = value.chefDeliveryDays;
    selectedCartItemIndex.value = selectedIndex;
  }

  gotoChangeDeliveryTimeScreen() {
    if (selectedCartItem.chefDeliveryDays.isEmpty) {
      return showFYSnackBar(message: "Please select an order to edit");
    }
    gotoDeliveryTimeScreen();
  }

  void gotoDeliveryTimeScreen() {
    Get.to(() => DeliveryTimeScreen(), arguments: {
      "deliveryDays": selectedCartItem.chefDeliveryDays,
    })?.then((value) => setNewDeliveryTimeAndDay(value));
  }

  void setDeliveryTime() {
    DateTime deliveryDate = DateTime.now()..add(Duration(hours: 3));
    if (deliveryDate.hour > 8 && deliveryDate.hour < 20) {
      deliveryDateString.value = DateTimeUtil.dateTimeToString(
        deliveryDate,
        Strings.DAY_MONTH_YEAR_HOUR_MINUTE_PM,
      );
    } else {
      showFYSnackBar(
          message: "No delivery for today please your specify delivery date");
    }
  }

  void setPhoneNumber() {
    deliveryRecipientNumber.value = user.value.phone;
  }

  setNewDeliveryTimeAndDay(Map? value) {
    if (value != null) {
      DeliveryDay deliveryDay = value["deliveryDay"];
      String deliverTime = value["deliverTime"];

      print("MMMMMMMMMMMMMMMMMM $deliveryDay");
      print("NNNNNNNNNNNNNNNNNN $deliverTime");

      // DateTime nowAsDateTime = DateTime.now();
      // String nowAsString =
      //     DateTimeUtil.dateTimeToDayOfWeek(nowAsDateTime).toLowerCase();

      // int indexOfSelectedDeliveryDate =
      //     selectedCartItem.chefDeliveryDays.indexWhere((e) => e == deliveryDay);
 
      // int indexOfDeliveryDate = selectedCartItem.chefDeliveryDays
      //     .indexWhere((e) => e == DeliveryDay(dayOfWeek: nowAsString));

      // while (nowAsString != deliveryDay.dayOfWeek) {
      //   if (indexOfSelectedDeliveryDate > indexOfDeliveryDate) {
      //     nowAsDateTime = nowAsDateTime.add(new Duration(days: 1));
      //   } else {
      //     nowAsDateTime = nowAsDateTime.subtract(new Duration(days: 1));
      //   }
      //   nowAsString =
      //       DateTimeUtil.dateTimeToDayOfWeek(nowAsDateTime).toLowerCase();
      // }

      // deliveryDate.value =
      //     "${DateTimeUtil.dateTimeToString(nowAsDateTime, Strings.DAY_MONTH_YEAR)} ${DateTimeUtil.dateTimeToString(deliverTime, Strings.HOUR_MINUTE_PM)}";

      selectedCartItem.specifiedDeliveryAndTime = deliveryDateString.value;
    }
  }
}
