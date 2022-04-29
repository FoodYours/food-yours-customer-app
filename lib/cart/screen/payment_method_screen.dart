// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/payment_method_screen_controller.dart';
import 'package:food_yours_customer/cart/widget/payment_info_card.dart';
import 'package:food_yours_customer/cart/widget/payment_method_cards.dart';
import 'package:food_yours_customer/cart/widget/place_order_button.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class PaymentMethodScreen extends StatelessWidget {
  final PaymentMethodScreenController widgetCtrl =
      Get.put(PaymentMethodScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(
            preferredSize: Size(sw(Dimens.k20), sh(Dimens.k46_41)),
            child: SecondaryAppBar(title: 'Payment Method')),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k18)),
            children: [
              SizedBox(height: sh(Dimens.k25)),
              Obx(
                () => PaymentMethodCards(
                  onPaymentMethodSelected: widgetCtrl.onPaymentMethodSelected,
                  paymentMethod: widgetCtrl.paymentMethod.value,
                ),
              ),
              SizedBox(height: sh(Dimens.k41)),
              Obx(
                () => PaymentInfoCard(
                  total: widgetCtrl.total.value,
                  orderId: widgetCtrl.orderId.value,
                  deliveryDate: widgetCtrl.deliveryDate.value,
                ),
              ),
              SizedBox(height: sh(Dimens.k40)),
              Obx(
                () => PlaceOrderButton(
                  widgetCtrl.placeOrder,
                  double.parse(widgetCtrl.total.value),
                ),
              ),
              SizedBox(height: sh(Dimens.k16)),
            ]),
      ),
    );
  }
}
