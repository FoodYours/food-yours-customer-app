import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/cart_tab_controller.dart';
import 'package:food_yours_customer/cart/widget/cart_card.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class CartTab extends StatelessWidget {
  final CartTabController widgetCtrl = Get.put(CartTabController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(
            preferredSize: Size(Dimens.k20, sh(Dimens.k46_41)),
            child: SecondaryAppBar(title: "Food Cart")),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sh(Dimens.k16)),
              Text("* Click on a saved order to check details or checkout",
                  style: context.theme.textTheme.headline3!.copyWith(
                    fontSize: sh(Dimens.k12),
                    fontWeight: FontWeight.w600,
                    color: FYColors.lighterBlack2,
                  )),
              SizedBox(height: sh(Dimens.k24)),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) => CartCard(
                      widgetCtrl.cartItems[index],
                    ),
                    itemCount: widgetCtrl.cartItems.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
