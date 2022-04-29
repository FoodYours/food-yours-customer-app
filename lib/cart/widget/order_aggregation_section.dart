import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/widget/place_order_button.dart';
import 'package:food_yours_customer/common/widget/text/inter_400_text.dart';
import 'package:food_yours_customer/common/widget/text/inter_500_text.dart';
import 'package:food_yours_customer/common/widget/text/inter_800_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class OrderAggregationSection extends StatelessWidget {
  final double subtotal;
  final double total;
  final Function() placeOrder;

  const OrderAggregationSection({
    Key? key,
    required this.subtotal,
    required this.total,
    required this.placeOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: sw(Dimens.k24), vertical: sh(Dimens.k16)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(Dimens.k8))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Inter400Text(
                    text: "Subtotal",
                    fontSize: sh(Dimens.k16),
                  ),
                  Inter400Text(
                    text: subtotal.toString(),
                    fontSize: sh(Dimens.k16),
                  )
                ],
              ),
              SizedBox(height: sh(Dimens.k8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Inter400Text(
                    text: "Delivery fee",
                    fontSize: sh(Dimens.k16),
                  ),
                  Inter400Text(
                    text: "N1,000",
                    fontSize: sh(Dimens.k16),
                  )
                ],
              ),
              SizedBox(
                height: sh(Dimens.k12),
              ),
              Divider(
                height: 0,
                thickness: 0.5,
              ),
              SizedBox(
                height: sh(Dimens.k9),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Inter500Text(
                    text: "Total",
                    fontSize: sh(Dimens.k14),
                  ),
                  Inter800Text(
                    text: total.toString(),
                    color: FYColors.mainRed,
                    fontSize: sh(Dimens.k16),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: sh(Dimens.k27),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sw(Dimens.k18),
          ),
          child: PlaceOrderButton(
            placeOrder,
            total,
          ),
        ),
        SizedBox(
          height: sh(Dimens.k16),
        ),
      ],
    );
  }
}
