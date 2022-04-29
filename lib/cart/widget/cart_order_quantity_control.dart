// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/common/widget/button/fy_icon_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class CartOrderQuantityControl extends StatelessWidget {
  final CartModel cartItem;
  final int indexOfCartItem;
  final Function increaseQuantity;
  final Function decreaseQuantity;

  CartOrderQuantityControl(
    this.cartItem,
    this.indexOfCartItem,
    this.increaseQuantity,
    this.decreaseQuantity,
  );

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    // Function sw = sWidth(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.k2),
          border: Border.all(color: FYColors.lighterBlack2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FYIconButton(
            onPressed: () => increaseQuantity(cartItem.id),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
            icon: Icons.add,
            iconSize: sh(Dimens.k12),
          ),
          SizedBox(
            height: sh(Dimens.k5_33),
          ),
          Mulish600Text(
            text: "${cartItem.count}",
            fontSize: sh(Dimens.k12),
            color: FYColors.darkerBlack2,
          ),
          SizedBox(
            height: sh(Dimens.k5_33),
          ),
          FYIconButton(
            onPressed: () => decreaseQuantity(cartItem.id),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
            icon: Feather.minus,
            iconSize: sh(Dimens.k12),
          )
        ],
      ),
    );
  }
}
