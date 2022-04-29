import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/orders/controller/order_summary_screen_controller.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class OrderSummaryScreen extends StatelessWidget {
  final OrderSummaryScreenController widgetCtrl =
      Get.put(OrderSummaryScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(20, sh(46.41)),
          child: SecondaryAppBar(title: "Order Summary")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: sw(23)),
        children: [
          SizedBox(height: sh(21)),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: sh(Dimens.k12),
                    fontWeight: FontWeight.w600,
                    color: FYColors.darkerBlack),
                text: "Order Status: ",
              ),
              TextSpan(
                style: context.theme.textTheme.headline3!.copyWith(
                    fontSize: sh(Dimens.k12), color: FYColors.mainBlue),
                text: widgetCtrl.cartItem.value.status,
              ),
            ]),
          ),
          SizedBox(height: sh(16)),
          Text(
            "Order ID:",
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack),
          ),
          SizedBox(height: sh(4)),
          Text(
            "Ofada Rice(1x), Zobo(2x), Doughnuts(5x).",
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack2),
          ),
          SizedBox(height: sh(16)),
          Text(
            "Chef:",
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack),
          ),
          SizedBox(height: sh(4)),
          Text(
            widgetCtrl.cartItem.value.chefName,
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.mainBlue),
          ),
          SizedBox(height: sh(16)),
          Text(
            "Delivery Address:",
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack),
          ),
          SizedBox(height: sh(4)),
          Text(
            widgetCtrl.cartItem.value.address,
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack2),
          ),
          SizedBox(height: sh(16)),
          Text(
            "Order Date:",
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack),
          ),
          SizedBox(height: sh(4)),
          Text(
            widgetCtrl.cartItem.value.specifiedDeliveryAndTime,
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack2),
          ),
          SizedBox(height: sh(16)),
          Text(
            "Delivery Date:",
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack),
          ),
          SizedBox(height: sh(4)),
          Text(
            widgetCtrl.cartItem.value.specifiedDeliveryAndTime,
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack2),
          ),
          SizedBox(height: sh(26)),
          Text(
            "Payment:",
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w600,
                color: FYColors.darkerBlack),
          ),
          SizedBox(height: sh(12)),
          Container(
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order Amount:",
                          style: context.theme.textTheme.caption!.copyWith(
                              fontSize: sh(Dimens.k12),
                              fontWeight: FontWeight.w600,
                              color: FYColors.darkerBlack2),
                        ),
                        Text(widgetCtrl.cartItem.value.total.toString(),
                            style: context.theme.textTheme.headline3!
                                .copyWith(fontSize: sh(Dimens.k12))),
                      ],
                    ),
                  ),
                  SizedBox(height: sh(16)),
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Fee:",
                          style: context.theme.textTheme.caption!.copyWith(
                              fontSize: sh(Dimens.k12),
                              fontWeight: FontWeight.w600,
                              color: FYColors.darkerBlack2),
                        ),
                        Text("N 700",
                            style: context.theme.textTheme.headline3!
                                .copyWith(fontSize: Dimens.k12)),
                      ],
                    ),
                  ),
                  SizedBox(height: sh(12)),
                  Divider(height: 0),
                  SizedBox(height: sh(12)),
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:",
                          style: context.theme.textTheme.caption!.copyWith(
                              fontSize: Dimens.k16,
                              fontWeight: FontWeight.w600,
                              color: FYColors.darkerBlack2),
                        ),
                        Text("N 5,600",
                            style: context.theme.textTheme.headline3!
                                .copyWith(fontSize: Dimens.k16)),
                      ],
                    ),
                  ),
                ],
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: sw(16), vertical: sh(12)),
              decoration: BoxDecoration(
                  color: FYColors.subtleBlue2,
                  borderRadius: BorderRadius.circular(8))),
          SizedBox(height: sh(60)),
          Container(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FYTextButton(
                  text: "Re-order",
                  onPressed: () {},
                ),
                SizedBox(height: sh(Dimens.k24)),
                LocalTheme(
                  child: FYTextButton(
                    text: "Rate Chef",
                    onPressed: widgetCtrl.gotoOrderTrackingScreen,
                  ),
                  buttonStyle: context.theme.textButtonTheme.style!.copyWith(
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(sw(122), sh(47)))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
