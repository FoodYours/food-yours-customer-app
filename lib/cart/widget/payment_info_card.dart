import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/widget/fy_dotted_line.dart';
import 'package:food_yours_customer/cart/widget/payment_method_card_item.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PaymentInfoCard extends StatelessWidget {
  final String total;
  final String orderId;
  final String deliveryDate;

  const PaymentInfoCard({
    Key? key,
    required this.total,
    required this.orderId,
    required this.deliveryDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: sh(Dimens.k26)),
      decoration: BoxDecoration(
        color: FYColors.subtleBlue3,
        borderRadius: BorderRadius.circular(Dimens.k12),
      ),
      height: sh(Dimens.k307),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k16)),
            child: Mulish400Text(
              text: "Amount to Pay",
              fontSize: sh(Dimens.k12),
              color: FYColors.lighterBlack2,
            ),
          ),
          SizedBox(height: sh(Dimens.k3)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k16)),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: context.theme.textTheme.caption!.copyWith(
                        fontSize: sh(Dimens.k24),
                        fontWeight: FontWeight.w700,
                        color: FYColors.mainBlue),
                    text: "${total.substring(0, total.indexOf("."))}",
                  ),
                  TextSpan(
                    style: context.theme.textTheme.caption!.copyWith(
                        fontSize: sh(Dimens.k12),
                        fontWeight: FontWeight.w400,
                        color: FYColors.mainBlue),
                    text: "${total.substring(total.indexOf("."))} N",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: sh(Dimens.k14),
          ),
          FYDottedLine(),
          SizedBox(
            height: sh(Dimens.k28),
          ),
          PaymentInfoCardItem(
            title: "Order from:",
            description:
                "${user.value.firstName} ${user.value.lastName.substring(0, 1)}",
          ),
          SizedBox(height: sh(Dimens.k24)),
          PaymentInfoCardItem(
            title: "Order ID:",
            description: orderId,
          ),
          SizedBox(height: sh(Dimens.k24)),
          PaymentInfoCardItem(
            title: "Order Date:",
            description: deliveryDate,
          ),
        ],
      ),
    );
  }
}
