import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/widget/payment_method_card.dart';
import 'package:food_yours_customer/cart/widget/payment_method_card_sub_title.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class PaymentMethodCards extends StatelessWidget {
  final Function(PaymentMethod value) onPaymentMethodSelected;
  final PaymentMethod paymentMethod;

  const PaymentMethodCards({
    Key? key,
    required this.onPaymentMethodSelected,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Row(
      children: [
        PaymentMethodCard(
          cardTitle: Mulish700Text(
            text: "My Wallet",
            fontSize: sh(Dimens.k16),
          ),
          cardSubTitle: PaymentMethodCardSubTitle(
            leading: "Blc: ",
            trailing: "N 22,500",
          ),
          onTap: () => onPaymentMethodSelected(PaymentMethod.WALLET),
          isSelected: paymentMethod == PaymentMethod.WALLET,
        ),
        PaymentMethodCard(
          cardTitle: Mulish700Text(
            text: "My Points",
            fontSize: sh(Dimens.k16),
          ),
          cardSubTitle: PaymentMethodCardSubTitle(
            leading: "Pts: ",
            trailing: "12",
          ),
          onTap: () => onPaymentMethodSelected(PaymentMethod.POINTS),
          isSelected: paymentMethod == PaymentMethod.POINTS,
        ),
        PaymentMethodCard(
          cardTitle: Center(
            child: Image.asset(Images.pay_stack,
                height: sh(Dimens.k25_24), width: sw(Dimens.k25_24)),
          ),
          cardSubTitle: Center(
            child: Mulish700Text(
              text: "Paystack",
              color: FYColors.subtleBlue5,
              fontSize: sh(Dimens.k13_17),
            ),
          ),
          isImage: true,
          onTap: () => onPaymentMethodSelected(PaymentMethod.PAYSTACK),
          isSelected: paymentMethod == PaymentMethod.PAYSTACK,
        ),
      ],
    );
  }
}
