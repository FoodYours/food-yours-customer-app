import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:food_yours_customer/cart/interface/interface_cart_order.dart';
import 'package:food_yours_customer/cart/service/food_yours_payment_service/food_yours_payment_service.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/dashboard/screen/dashboard_screen.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class PaymentMethodScreenController extends GetxController
    implements ICartOrder {
  final FoodYoursPaymentService foodYoursPaymentService = Get.find();

  Rx<PaymentMethod> paymentMethod = PaymentMethod.DEFAULT.obs;

  RxString total = "0.0".obs;
  RxString deliveryDate = "".obs;
  RxString orderId = "".obs;

  @override
  void onReady() {
    total.value = Get.arguments["total"].toString();
    deliveryDate.value = Get.arguments["deliveryDate"];
    super.onReady();
  }

  @override
  placeOrder() async {
    switch (paymentMethod.value) {
      case PaymentMethod.DEFAULT:
        showFYSnackBar(message: "Please select a method of payment");
        break;
      case PaymentMethod.PAYSTACK:
        payWithPaystack();
        break;
      case PaymentMethod.WALLET:
        showFYSnackBar(message: "Coming soon ...");
        break;
      case PaymentMethod.POINTS:
        showFYSnackBar(message: "Coming soon ...");
        break;
      default:
    }
  }

  payWithPaystack() async {
    Charge charge = generateCharge();

    CheckoutResponse checkoutResponse =
        await foodYoursPaymentService.checkOut(charge);

    if (checkoutResponse.status) return gotoDashBoard();

    showFYSnackBar(message: "An error occured ...");
  }

  onPaymentMethodSelected(PaymentMethod value) {
    paymentMethod.value = value;
  }

  Charge generateCharge() {
    return Charge()
      ..amount = int.parse(total.value.substring(0, total.value.indexOf(".")))
      ..reference = "qwertyuioo" /* _getReference() */
      // or ..accessCode = _getAccessCodeFrmInitialization()
      ..email = user.value.email;
  }

  initiatePayStackPayment() async {}

  void gotoDashBoard() {
    Get.to(() => DashboardScreen());
  }
}
