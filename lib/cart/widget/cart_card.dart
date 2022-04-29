import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/cart_tab_controller.dart';
import 'package:food_yours_customer/cart/view_model/cart_items_view_model.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/key_value_text.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/money_formatter_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class CartCard extends StatelessWidget {
  final CartTabController widgetCtrl = Get.find<CartTabController>();

  final CartItemsViewModel cartItem;

  CartCard(this.cartItem);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return FYFlatButton(
      onPressed: widgetCtrl.gotoCartOrderSummaryScreen,
      child: Container(
        height: sh(Dimens.k98),
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k8)),
        decoration: BoxDecoration(
          color: context.theme.backgroundColor,
          borderRadius: BorderRadius.circular(Dimens.k4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              blurRadius: 8,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: FadeInImage.assetNetwork(
                      placeholder: Images.female_chef,
                      image: cartItem.chefImage,
                      height: sh(Dimens.k82),
                      width: sh(Dimens.k86),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (c, o, t) => Image.asset(
                        Images.female_chef,
                        height: sh(Dimens.k82),
                        width: sh(Dimens.k86),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sh(Dimens.k7),
                  ),
                  Container(
                    width: sw(Dimens.k212),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KeyValueText(
                          keyText: "Order Chef: ",
                          valueText: cartItem.chefName,
                        ),
                        SizedBox(
                          height: sh(Dimens.k8),
                        ),
                        KeyValueText(
                          keyText: "Total Price: ",
                          valueText: MoneyFormatterUtil.format(cartItem.total),
                          valueTextColor: FYColors.mainRed,
                        ),
                        SizedBox(
                          height: sh(Dimens.k8),
                        ),
                        KeyValueText(
                          keyText: "Default Address: ",
                          valueText: "",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
