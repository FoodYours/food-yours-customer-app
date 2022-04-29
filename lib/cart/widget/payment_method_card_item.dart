import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class PaymentInfoCardItem extends StatelessWidget {
  final String title;
  final String description;

  const PaymentInfoCardItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k16)),
          child: Mulish400Text(
            text: title,
            fontSize: sh(Dimens.k12),
          ),
        ),
        SizedBox(height: sh(Dimens.k3)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k16)),
          child: Mulish700Text(
            text: description,
            fontSize: sh(Dimens.k12),
            color: FYColors.mainBlue,
          ),
        ),
      ],
    );
  }
}
