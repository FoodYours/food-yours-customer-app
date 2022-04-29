import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PaymentMethodCardSubTitle extends StatelessWidget {
  final String leading;
  final String trailing;

  const PaymentMethodCardSubTitle({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            style: context.theme.textTheme.headline2!.copyWith(
              fontSize: sh(Dimens.k12),
            ),
            text: leading,
          ),
          TextSpan(
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k12),
                fontWeight: FontWeight.w800,
                color: FYColors.mainBlue),
            text: trailing,
          ),
        ],
      ),
    );
  }
}
