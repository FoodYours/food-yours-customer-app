import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class PlaceOrderButton extends StatelessWidget {
  final Function()? placeOrder;
  final double orderCost;

  PlaceOrderButton(this.placeOrder, this.orderCost);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return FYFlatButton(
      onPressed: placeOrder,
      backgroundColor: FYColors.mainRed,
      child: Padding(
        padding: EdgeInsets.only(left: sw(Dimens.k24), right: sw(Dimens.k28)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Mulish400Text(
              text: "\u{020A6}" " $orderCost",
              fontSize: sh(Dimens.k16),
              color: Colors.white,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: sh(Dimens.k12),
            )
          ],
        ),
      ),
    );
  }
}
