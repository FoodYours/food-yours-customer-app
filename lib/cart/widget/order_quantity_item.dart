import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/cart/widget/cart_order_quantity_control.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/text/inter_500_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class OrderQuantityItem extends StatelessWidget {
  final Function onCartItemSelected;
  final CartModel cartItem;
  final int indexOfCartItem;
  final Function increaseItemQuantity;
  final Function decreaseItemQuantity;
  final bool isSelected;

  OrderQuantityItem({
    required this.cartItem,
    required this.indexOfCartItem,
    required this.increaseItemQuantity,
    required this.decreaseItemQuantity,
    required this.onCartItemSelected,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return FYFlatButton(
      onPressed: () => onCartItemSelected(
        cartItem,
        indexOfCartItem,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Inter500Text(
                    text: cartItem.mealName,
                    fontSize: sh(Dimens.k16),
                    color: FYColors.darkerBlack2,
                  ),
                  SizedBox(
                    height: sh(Dimens.k12),
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        style: context.theme.textTheme.headline1!.copyWith(
                          color: FYColors.mainRed,
                          fontSize: sh(Dimens.k16),
                        ),
                        text: cartItem.total.toString(),
                      ),
                      TextSpan(
                        style: context.theme.textTheme.headline6!.copyWith(
                          color: FYColors.lighterBlack2,
                          fontSize: sh(Dimens.k12),
                        ),
                        text: " N${cartItem.minimumMealPrice}/minimum",
                      ),
                    ]),
                  ),
                ],
              ),
              CartOrderQuantityControl(
                cartItem,
                indexOfCartItem,
                increaseItemQuantity,
                decreaseItemQuantity,
              ),
            ],
          ),
          SizedBox(
            height: sh(Dimens.k8),
          ),
          Divider(
            color: isSelected ? FYColors.mainBlack : null,
            thickness: isSelected ? Dimens.k2 : null,
          ),
        ],
      ),
    );
  }
}
